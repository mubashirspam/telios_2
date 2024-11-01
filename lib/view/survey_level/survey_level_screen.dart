import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/view/view.dart';
import 'package:telios_2/view_model/view_model.dart';
import '../../model/model.dart';
import '../../settings/helper/enums.dart';
import '../../settings/helper/responsive.dart';
import 'dart:developer';

class SurveyLevelHome extends GetView<LevelController> {
  final MapLevel mapLevel;

  const SurveyLevelHome({
    super.key,
    required this.mapLevel,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<LevelController>().fetchSurveyLevel(mapLevel);
      Get.find<SurveyController>().postSurveyAnswerRemote();
      Get.find<SurveyController>().fetchSurveyQustions(
          assignedLevelKey: mapLevel.assignedLevelKey ?? '');
    });
    return GetBuilder<LevelController>(
      builder: (controller) {
        if (controller.surveyResponse.state == ResponseState.loading ||
            controller.isSurveyScreenLoading.value) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (controller.surveyResponse.state == ResponseState.error) {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }
        if (controller.surveyResponse.state == ResponseState.completed &&
            controller.surveyResponse.data != null &&
            controller.surveyResponse.data!.isNotEmpty &&
            !controller.isSurveyScreenLoading.value) {
          return SurveyLevelScreenBody(
            controller: controller,
            mapLevel: mapLevel,
          );
        }
        return const Scaffold(
          body: Center(
            child: Text('No Data'),
          ),
        );
      },
    );
  }
}

class SurveyLevelScreenBody extends StatelessWidget {
  final LevelController controller;
  final MapLevel mapLevel;

  const SurveyLevelScreenBody({
    super.key,
    required this.controller,
    required this.mapLevel,
  });

  @override
  Widget build(BuildContext context) {
    log("================= Rebuided===================");
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            AppbarWidget(level: mapLevel),
           if (!Responsive.isMobile(context)) const SizedBox(height: 20),
            if (!Responsive.isMobile(context))
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.selectedLevel.value != -1)
                        FormWidget(
                          assignedLevelKey: mapLevel.assignedLevelKey!,
                          mapLevel: mapLevel,
                          level: controller.selectedSurveyLevelItem.value!,
                        ),
                      Expanded(
                        child: (controller.isMapSelected.value ||
                                controller.selectedLevel.value == -1)
                            ? SfMapWidget(
                                colorMapper:
                                    Get.find<SurveyController>().colorMappers,
                                levels: controller.surveyLevels,
                                geoJsonBytes: controller.geoJsonBytes.value!,
                                shapeDataField: controller.shapeDataField.value,
                                selectedIndex: controller.selectedLevel.value,
                              )
                            : const SizedBox(),
                      ),
                      if (!controller.isMapSelected.value)
                        ListViewWidget(
                          levels: controller.surveyLevels,
                        )
                    ],
                  ),
                ),
              ),
            if (Responsive.isMobile(context) &&
                controller.selectedLevel.value != -1)
              SizedBox(
                child: FormWidget(
                  assignedLevelKey: mapLevel.assignedLevelKey!,
                  level: controller.selectedSurveyLevelItem.value!,
                  mapLevel: mapLevel,
                ),
              ),
            if ((Responsive.isMobile(context) &&
                    controller.isMapSelected.value) &&
                controller.selectedLevel.value == -1)
              Expanded(
                child: SfMapWidget(
                  colorMapper: Get.find<SurveyController>().colorMappers,
                  levels: controller.surveyLevels,
                  geoJsonBytes: controller.geoJsonBytes.value!,
                  shapeDataField: controller.shapeDataField.value,
                  selectedIndex: controller.selectedLevel.value,
                ),
              ),
            if (Responsive.isMobile(context) &&
                !controller.isMapSelected.value &&
                controller.selectedLevel.value == -1)
              Expanded(
                  child: ListViewWidget(
                levels: controller.surveyLevels,
              ))
          ],
        ),
      ),
    );
  }
}
