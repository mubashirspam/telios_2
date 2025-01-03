import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/settings/settings.dart';
import 'package:telios_2/view/widgets/widgets.dart';
import 'package:telios_2/view_model/view_model.dart';
import 'package:telios_2/view_model/dashboard/dashboard_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerWidget(
                margin: const EdgeInsets.all(10).copyWith(top: 0),
                child: _buildSummarySection(context)),
            // ContainerWidget(
            //     height: 300,
            //     margin: const EdgeInsets.all(10).copyWith(top: 0),
            //     child: _buildSurveyCategorySection(context)),
            ContainerWidget(
                margin: const EdgeInsets.all(10).copyWith(top: 0),
                child: _buildPendingDataSection(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildSummarySection(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        final stats = controller.dashboardStats;

        final assignedLevelCount = stats['assignedLevelCount'] as int? ?? 0;
        final mapLevelCount = stats['mapLevelCount'] as int? ?? 0;
        final surveyLevelCount = stats['surveyLevelCount'] as int? ?? 0;
        final surveyedCount = stats['surveyedCount'] as int? ?? 0;
        final notSurveyedCount = surveyLevelCount - surveyedCount;
        final pendingCount = notSurveyedCount;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Summary',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildCountCard(
                    context,
                    'Assigned Levels',
                    assignedLevelCount.toString(),
                    Colors.blue.shade100,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildCountCard(
                    context,
                    'Map Levels',
                    mapLevelCount.toString(),
                    Colors.purple.shade100,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildCountCard(
                    context,
                    'Survey Levels',
                    surveyLevelCount.toString(),
                    Colors.teal.shade100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildCountCard(
                    context,
                    'Surveyed',
                    surveyedCount.toString(),
                    Colors.green.shade100,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildCountCard(
                    context,
                    'Not Surveyed',
                    notSurveyedCount.toString(),
                    Colors.orange.shade100,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildCountCard(
                    context,
                    'Pending',
                    pendingCount.toString(),
                    Colors.red.shade100,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildSurveyCategorySection(BuildContext context) {
    return GetBuilder<SurveyController>(
      builder: (surveyController) {
        return GetBuilder<DashboardController>(
          builder: (dashboardController) {
            final stats = dashboardController.dashboardStats;
            final categoryList = stats['categoryList'] as Map<int, int>? ?? {};
            final categoryPercentages =
                stats['categoryPercentages'] as Map<int, double>? ?? {};
            final totalCategorizedSurveys =
                stats['totalCategorizedSurveys'] as int? ?? 0;
            final surveyedCount = stats['surveyedCount'] as int? ?? 0;
            final categoryMap = surveyController.categoryList;

            log(categoryMap
                .map((e) => '${e.questionId} : ${e.categoryName}')
                .toString());

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Survey Categories',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 150,
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  surveyedCount.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primary,
                                      ),
                                ),
                              ),
                              Center(
                                child: PieChartWidget(
                                  radius: 35,
                                  centerSpaceRadius: 35,
                                  isNotGlobel: false,
                                  data: categoryPercentages,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...categoryMap.map((category) {
                              final count =
                                  categoryList[category.questionId] ?? 0;
                              Color color = category.categoryColor == null
                                  ? Colors.grey.shade300
                                  : Color(category.categoryColor!);

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: _buildIdentification(
                                  color,
                                  "${category.categoryName} : $count",
                                  context,
                                ),
                              );
                            }),
                            // Add uncategorized if present
                            if (categoryList.containsKey(0))
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: _buildIdentification(
                                  Colors.grey.shade300,
                                  "Uncategorized : ${categoryList[0]}",
                                  context,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildIdentification(Color color, String name, BuildContext context) =>
      Row(
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

  Widget _buildPendingDataSection(BuildContext context) {
    return GetBuilder<SurveyController>(
      builder: (controller) {
        if (!controller.presentDataForSync.value) {
          return const SizedBox();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pending Data',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextButton.icon(
                  onPressed: () {
                    controller.postSurveyAnswerRemote();
                  },
                  icon: const Icon(Icons.sync, size: 18),
                  label: Text(
                    controller.u.state == ResponseState.loading
                        ? 'Syncing'
                        : 'Sync All',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.surveyTemp.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 15,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 150,
              ),
              itemBuilder: (context, index) {
                final data = controller.surveyTemp[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text(
                      data.surveyLevelName ?? '',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.surveyLevelKey ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          data.geoJsonLevelName ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildCountCard(
    BuildContext context,
    String title,
    String count,
    Color color,
  ) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 5),
            Text(
              count,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
