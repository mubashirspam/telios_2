import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/model.dart';
import '../../../settings/settings.dart';
import '../../../view_model/view_model.dart';
import '../../widgets/widgets.dart';

class AssignedLevelItem extends StatelessWidget {
  final AssignedLevel level;
  const AssignedLevelItem({
    super.key,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  level.levelName ?? '',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                BackButtonWidget(
                  isForward: true,
                  onPress: () {
                    Get.find<LevelController>().gotToNextLevel(level);
                  },
                )
              ],
            ),
          ),
          const Divider(height: 3, color: AppColor.backround),
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(),
              Text(
                "Basic Details",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Column(
                spacing: 5,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${level.assignedLevel} Code',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: AppColor.textSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              'Number of ${level.geoJsonLevel}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: AppColor.textSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              'Number of ${level.surveyLevel}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: AppColor.textSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        child: Column(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              ":",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: AppColor.textSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              ":",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: AppColor.textSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              ":",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: AppColor.textSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              level.levelKey.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: AppColor.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              level.geoJsonLevelCount.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: AppColor.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              level.surveyLevelCount.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: AppColor.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Responsive.isMobile(context)
                ? const Column(
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            // Expanded(child: _buildDistrictPiChart(context)),
                            // _buildDistrictValues(context),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //           child: _buildVillagePiChart(context, total)),
                      //       Expanded(
                      //           child: _buildVillageValues(context, total)),
                      //     ],
                      //   ),
                      // ),
                    ],
                  )
                : const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Expanded(child: _buildDistrictPiChart(context)),
                      // _buildDistrictValues(context),
                      // Expanded(child: _buildVillagePiChart(context, total)),
                      // _buildVillageValues(context, total),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  // Widget _buildVillagePiChart(BuildContext context, int total) {
  //   return SizedBox(
  //     width: double.maxFinite,
  //     height: 200,
  //     child: Stack(
  //       children: [
  //         Center(
  //             child: Text(
  //           assignedLevel.surveyLevelCount == null
  //               ? "0"
  //               : assignedLevel.surveyLevelCount!.toStringAsFixed(0),
  //           // "",
  //           style: Theme.of(context).textTheme.titleLarge!.copyWith(
  //                 fontWeight: FontWeight.bold,
  //                 color: AppColor.primary,
  //               ),
  //         )),
  //         Center(
  //           child: PieChartWidget(
  //             isNotGlobel: false,
  //             data: {
  //               "PC":
  //                   (assignedLevel.pc! / assignedLevel.surveyLevelCount!) * 100,
  //               "MC":
  //                   (assignedLevel.mc! / assignedLevel.surveyLevelCount!) * 100,
  //               "HC":
  //                   (assignedLevel.hc! / assignedLevel.surveyLevelCount!) * 100,
  //               "AV":
  //                   (assignedLevel.av! / assignedLevel.surveyLevelCount!) * 100,
  //               "EM": ((assignedLevel.surveyLevelCount! - total) /
  //                       assignedLevel.surveyLevelCount!) *
  //                   100,
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildVillageValues(BuildContext context, int total) {
  //   return SizedBox(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         idetification(AppColor.pc, "BLUE : ${assignedLevel.pc}", context),
  //         const SizedBox(height: 10),
  //         idetification(AppColor.mc, "RED: ${assignedLevel.mc}", context),
  //         const SizedBox(height: 10),
  //         idetification(AppColor.hc, "GREEN : ${assignedLevel.hc}", context),
  //         const SizedBox(height: 10),
  //         idetification(AppColor.av, "YELLOW : ${assignedLevel.av}", context),
  //         const SizedBox(height: 10),
  //         idetification(Colors.grey.shade300,
  //             "WHITE : ${(assignedLevel.surveyLevelCount! - total)}", context)
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildDistrictPiChart(BuildContext context) {
  //   return SizedBox(
  //       width: double.maxFinite,
  //       height: 200,
  //       child: Stack(
  //         children: [
  //           Center(
  //               child: Text(
  //             assignedLevel.geoJsonLevelCount!.toStringAsFixed(0),
  //             style: Theme.of(context).textTheme.titleLarge!.copyWith(
  //                   fontWeight: FontWeight.bold,
  //                   color: AppColor.primary,
  //                 ),
  //           )),
  //           Center(
  //             child: PieChartWidget(
  //               isNotGlobel: true,
  //               data: {
  //                 "Unsurveyed": 100 -
  //                     ((assignedLevel.surveyedgeoJsonLevelCount! /
  //                             assignedLevel.geoJsonLevelCount!) *
  //                         100),
  //                 "Surveyed": (assignedLevel.surveyedgeoJsonLevelCount! /
  //                         assignedLevel.geoJsonLevelCount!) *
  //                     100,
  //               },
  //             ),
  //           ),
  //         ],
  //       ));
  // }

  // _buildDistrictValues(BuildContext context) {
  //   return SizedBox(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         idetification(
  //             Colors.grey.shade300,
  //             "Unsurveyed ${assignedLevel.geoJsonLevel} :${(assignedLevel.geoJsonLevelCount!) - (assignedLevel.surveyedgeoJsonLevelCount!)} ",
  //             context),
  //         const SizedBox(height: 10),
  //         idetification(
  //             AppColor.primary,
  //             "Surveyed ${assignedLevel.geoJsonLevel} :${assignedLevel.surveyedgeoJsonLevelCount} ",
  //             context)
  //       ],
  //     ),
  //   );
  // }

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
