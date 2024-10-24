import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/settings/settings.dart';
import 'package:telios_2/view/view.dart';
import 'package:telios_2/view_model/view_model.dart';
import '../../../model/model.dart';
import '../../widgets/widgets.dart';

class MapLevelItem extends StatelessWidget {
  final MapLevel mapLevel;
  final List<ListingModel> pieChartData;
  final int surveyLevelCount;

  const MapLevelItem({
    super.key,
    required this.mapLevel,
    required this.pieChartData,
    required this.surveyLevelCount,
  });

  @override
  Widget build(BuildContext context) {
    RxList<SurveyCategory> categoryMap =
        Get.find<SurveyController>().categoryList;

    final ListingModel chartData =
        pieChartData.firstWhere((element) => element.id == mapLevel.levelKey);

    final Map<int, dynamic> categoryList =
        Map.from(chartData.categoryList ?? {});

    final Map<int, double> finalCategoryMap = {};
    int totalCountInCategories = 0;

    for (var value in categoryMap) {
      int questionId = value.questionId ?? 0;

      int count = categoryList[questionId] ?? 0;
      totalCountInCategories += count;

      finalCategoryMap[value.questionId ?? 0] =
          surveyLevelCount > 0 ? (count / surveyLevelCount) * 100 : 0;
    }

    final int remainingCount = surveyLevelCount - totalCountInCategories;
    if (remainingCount > 0) {
      categoryList[0] = remainingCount;
      finalCategoryMap[0] = (remainingCount / surveyLevelCount) * 100;
    }

    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.04),
            blurRadius: 100,
            offset: const Offset(1, 1),
            spreadRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mapLevel.levelName!,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(mapLevel.levelKey!,
                            style: const TextStyle(
                                color: AppColor.textSecondary, fontSize: 14)),
                      ],
                    ),
                  ),
                  BackButtonWidget(
                    isForward: true,
                    onPress: () async {
                      Get.toNamed(
                        RouterName.surveyLevel,
                        arguments: mapLevel,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: double.maxFinite,
            height: 5,
            child: ColoredBox(color: AppColor.backround),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: Stack(
                        children: [
                          Center(
                              child: Text(
                            surveyLevelCount.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary),
                          )),
                          Center(
                            child: PieChartWidget(
                              radius: 25,
                              centerSpaceRadius: 25,
                              isNotGlobel: false,
                              data: finalCategoryMap,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...categoryMap.map((category) {
                            final count =
                                categoryList[category.questionId] ?? 0;
                            Color color = category.categoryColor == null
                                ? Colors.grey.shade300
                                : category.categoryColor == null
                                    ? Colors.grey.shade300
                                    : Color(category.categoryColor!);

                            if (category.questionId == 0) {
                              color = Colors.grey.shade300;
                            }

                            final name = category.categoryName;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: idetification(
                                color,
                                "$name : $count",
                                context,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget idetification(Color color, String name, BuildContext context) => Row(
        children: [
          ColoredBox(
            color: color,
            child: const SizedBox(
              width: 15,
              height: 15,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColor.textSecondary),
          )
        ],
      );
}
