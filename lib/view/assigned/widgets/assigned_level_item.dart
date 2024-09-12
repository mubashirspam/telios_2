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
    // int total = (assignedLevel.pc ?? 0) +
    //     (assignedLevel.hc ?? 0) +
    //     (assignedLevel.mc ?? 0) +
    //     (assignedLevel.av ?? 0);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
                  Text(
                    level.levelName!,
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
          ),
          const SizedBox(
            width: double.maxFinite,
            height: 5,
            child: ColoredBox(color: AppColor.backround),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Text(
              "Basic Details",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
            child:
                content(context, "${level.assignedLevel} Code", level.levelKey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: content(context, "Number of ${level.geoJsonLevel}",
                level.geoJsonLevelCount),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: content(context, "Number of ${level.surveyLevel}",
                level.surveyLevelCount),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Text(
              "Survey Status",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Responsive.isMobile(context)
                ? Column(
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
                : Row(
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

  Widget content(BuildContext context, String heading, content) => SizedBox(
        child: Row(
          children: [
            Expanded(
              child: Text(
                heading,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppColor.textSecondary),
              ),
            ),
            Text(
              ":",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColor.textSecondary),
            ),
            Expanded(
              child: Text(
                content.toString(),
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppColor.textSecondary),
              ),
            ),
          ],
        ),
      );
}
