import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:telios_2/model/model.dart';
import '../../settings/settings.dart';
import '../survey/survey_controller.dart';
import 'level_service.dart';

class LevelController extends GetxController {
  final _service = Get.find<LevelService>();
  final _sureveyController = Get.find<SurveyController>();

  ApiResponse<List<AssignedLevel>> response = ApiResponse.initial();
  ApiResponse<List<MapLevel>> mapResponse = ApiResponse.initial();
  ApiResponse<List<SurveyLevel>> surveyResponse = ApiResponse.initial();

  RxBool isSurveyScreenLoading = true.obs;

  RxList<ListingModel> surveyLevels = RxList<ListingModel>([]);

  List<ListingModel> mapLevels = [];
  List<MapLevel> filterdMapLevel = [];

  Rxn<Level> level = Rxn();
  RxString shapeDataField = 'Level3'.obs;

  Rxn<Uint8List> geoJsonBytes = Rxn<Uint8List>();

  final debouncer = DebouncerFun(milliseconds: 300);

  RxBool isMapSelected = true.obs;

  RxInt selectedLevel = RxInt(-1);
  Rxn<SurveyLevel> selectedSurveyLevelItem = Rxn<SurveyLevel>();

  void selectMap() {
    isMapSelected.value = !isMapSelected.value;
    update();
  }

  Future<void> selectALevel(int index) async {
    selectedLevel.value = index;
    if (selectedLevel.value == -1) {
      selectedSurveyLevelItem.value = null;
    } else {
      selectedSurveyLevelItem.value = surveyResponse.data![index];
      await _sureveyController
          .selectAnAnswer(selectedSurveyLevelItem.value!.levelKey ?? '');
    }
    log("selected value ${selectedLevel.value}");
    update();
  }

  void gotToNextLevel(AssignedLevel assignedLevel) {
    final i = assignedLevel.assignedLevelId;
    

    log("assignedLevel id =============${i}");

    if (i != null) {
      level.value = Level(
        sId: i + 1,
        aId: i - 1,
        mId: i,
      );
      switch (i) {
        case 1:
          shapeDataField.value = 'Level2';
          break;
        case 2:
          shapeDataField.value = 'Level3';
          break;
        case 3:
          shapeDataField.value = 'Level4';
          break;
        default:
          shapeDataField.value = 'Level4';
          break;
      }
      Get.toNamed(RouterName.mapLevel, arguments: assignedLevel);
    }
    update();
  }

  Future<void> fetchAssignedLevel() async {
    if (response.state == ResponseState.completed ||
        response.state == ResponseState.loading) {
      return;
    }
    response = ApiResponse.loading();

    update();

    final localResult = await _service.fetchAssignedLevel(isRemote: false);

    localResult.fold(
      (failure) async {
        final remoteResult = await _service.fetchAssignedLevel(isRemote: true);
        remoteResult.fold(
          (remoteFailure) {
            response = ApiResponse.error(remoteFailure);
            update();
          },
          (success) {
            response = ApiResponse.completed(success);

            update();
          },
        );
      },
      (localUserModel) async {
        response = ApiResponse.completed(localUserModel);
        update();
        _service.fetchAssignedLevel(isRemote: true);
      },
    );
  }

  Future<void> fetchMapLevel(String levelId) async {
    if (mapResponse.state == ResponseState.loading) {
      return;
    }
    mapResponse = ApiResponse.loading();

    update();

    await _sureveyController.fetchSurveyQustions(assignedLevelKey: levelId);

    if (_sureveyController.questionsModelList.isEmpty ||
        _sureveyController.categoryList.isEmpty ||
        _sureveyController.categoryList.length < 2) {
      // mapResponse =
      //     ApiResponse.error(MainFailure(message: "No Survey Data Found"));
      log("message: No Survey Data Found");
      // return;
    }

    final localResult = await _service.fetchMapLevel(
        isRemote: false, levelId: levelId, id: level.value!.mId!);

    localResult.fold(
      (failure) async {
        final remoteResult = await _service.fetchMapLevel(
            isRemote: true, levelId: levelId, id: level.value!.mId!);
        remoteResult.fold(
          (remoteFailure) {
            mapResponse = ApiResponse.error(remoteFailure);
            update();
          },
          (remoteUserModel) async {
            final answerData = await getMapLevelChartData(levelId);
            createMapLevelsList(remoteUserModel, answerData);
            filterdMapLevel = remoteUserModel;
            mapResponse = ApiResponse.completed(remoteUserModel);
            update();
          },
        );
      },
      (localUserModel) async {
        final answerData = await getMapLevelChartData(levelId);
        createMapLevelsList(localUserModel, answerData);
        filterdMapLevel = localUserModel;
        mapResponse = ApiResponse.completed(localUserModel);

        update();
      },
    );
  }

  Future<void> fetchSurveyLevel(MapLevel event) async {
    log("********************Fetch Survey Level Called********************");
    if (surveyResponse.state == ResponseState.loading) {
      return;
    }
    isSurveyScreenLoading.value = true;
    surveyResponse = ApiResponse.loading();
    update();
    try {
      await _sureveyController.fetchSurveyAnswers(
          geoJsonLevelKey: event.levelKey);
      await Future.delayed(const Duration(milliseconds: 200));

      final result = await _service.fetchSurveyLevel(
          levelId: event.levelKey!, isRemote: false);

      result.fold(
        (failure) async {
          surveyResponse = ApiResponse.error(failure);
          update();
        },
        (success) async {
          geoJsonBytes.value =
              Uint8List.fromList(utf8.encode(event.geoJson ?? ''));

          createSurveyLevelsList(
              success, _sureveyController.surveyLevelAnswers);
          await selectALevel(-1);
          await Future.delayed(const Duration(milliseconds: 200));
          surveyResponse = ApiResponse.completed(success);

          update();
        },
      );
    } catch (e) {
      log(e.toString());
    } finally {
      isSurveyScreenLoading.value = false;
      
    }
  }

  void searchMapLevel(String query) {
    debouncer.run(() {
      if (mapResponse.state == ResponseState.completed &&
          mapResponse.data != null &&
          mapResponse.data!.isNotEmpty) {
        List<MapLevel> result;
        if (query.isEmpty) {
          result = mapResponse.data!;
        } else {
          result = mapResponse.data!.where((v) {
            return v.levelName != null &&
                    v.levelKey != null &&
                    v.levelKey!.toLowerCase().contains(query.toLowerCase()) ||
                v.levelName!.toLowerCase().contains(query.toLowerCase());
          }).toList();
        }
        filterdMapLevel = result;
        update();
      }
    });
  }

  void createSurveyLevelsList(
    List<SurveyLevel> response,
    List<SurveyAnswerModel>? answers,
  ) {
    surveyLevels.clear();
    for (var level in response) {
      SurveyAnswerModel? matchingAnswer = answers?.firstWhere(
        (answer) => answer.surveyLevelKey == level.levelKey,
        orElse: () => SurveyAnswerModel(),
      );
      int category = matchingAnswer?.sCategory ?? 0;
      ListingModel newListing = ListingModel(level.levelName ?? 'UnknownLevel',
          category, level.levelKey ?? 'UnknownKey', null);
      surveyLevels.add(newListing);
    }
  }

  void createMapLevelsList(
    List<MapLevel> response,
    List<SurveyAnswerModel>? answers,
  ) {
    mapLevels.clear();
    final categoryMap = _sureveyController.categoryList;

    for (var level in response) {
      List<SurveyAnswerModel> matchingAnswers = answers?.where((answer) {
            return answer.geoJsonLevelKey == level.levelKey;
          }).toList() ??
          [];

      Map<int, int> categoryCount = {};

      for (var answer in matchingAnswers) {
        int category = answer.sCategory ?? 0;

        if (categoryMap.any((test) => test.questionId == category)) {
          categoryCount[category] = (categoryCount[category] ?? 0) + 1;
        }
      }

      Map<int, int> categoryList = {};
      categoryCount.forEach((key, value) {
        categoryList[key] = value;
      });

      ListingModel newListing = ListingModel(
        level.levelName ?? 'UnknownLevel',
        matchingAnswers.isNotEmpty ? matchingAnswers.first.sCategory ?? 0 : 0,
        level.levelKey ?? 'UnknownKey',
        categoryList.isNotEmpty ? categoryList : null,
      );
      debugPrint("catergory List : ${newListing.categoryList}");
      mapLevels.add(newListing);
    }
  }

  Future<List<SurveyAnswerModel>> getMapLevelChartData(String levelId) async {
    await _sureveyController.fetchSurveyAnswers(assignedLevelKey: levelId);
    return _sureveyController.geoJsonLevelAnswers;
  }
}
