import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../settings/settings.dart';
import '../../view_model/survey/survey_controller.dart';

class PieChartWidget extends StatelessWidget {
  final double? centerSpaceRadius;
  final double? radius;
  final Map<int, dynamic> data;
  final bool isNotGlobel;
  const PieChartWidget({
    super.key,
    required this.data,
    required this.isNotGlobel,
    this.centerSpaceRadius,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final categoryMap = Get.find<SurveyController>().categoryList;
    return AspectRatio(
        aspectRatio: 1,
        child: PieChart(PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: centerSpaceRadius ?? 30,
          startDegreeOffset: 0,
          sections: List.generate(
            data.length,
            (index) {
              final category = data.keys.elementAt(index);

              final value = data[category]?.toDouble() ?? 0;

              Color cardColor = Colors.white;
              for (var c in categoryMap) {
                if (c.questionId == category && c.categoryColor != null) {
                  cardColor = Color(c.categoryColor!);
                  break;
                }
              }

              if (category == 0) {
                cardColor = Colors.grey.shade300;
              }

              return PieChartSectionData(
                color: cardColor,
                value: value,
                title: '${value.toStringAsFixed(0)} %',
                radius: radius ?? 35,
                titleStyle: TextStyle(
                  fontSize: centerSpaceRadius != null ? 8 : 12,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textPrimary,
                ),
              );
            },
          ),
        )));
  }
}

// class PieChartWidget extends StatelessWidget {
//   // ignore: prefer_const_constructors_in_immutables

//   @override
//   Widget build(BuildContext context) {
//     final List<ChartData> chartData = [
//       ChartData('David', 25, Color.fromRGBO(9, 0, 136, 1)),
//       ChartData('Steve', 38, Color.fromRGBO(147, 0, 119, 1)),
//       ChartData('Jack', 34, Color.fromRGBO(228, 0, 124, 1)),
//       ChartData('Others', 52, Color.fromRGBO(255, 189, 57, 1))
//     ];
//     return Container(
//       width: 200,
//       height: 200,
//       child: Stack(
//         children: [
//           SfCircularChart(series: <CircularSeries>[
//             // Renders doughnut chart
//             DoughnutSeries<ChartData, String>(
//                 dataSource: chartData,
//                 pointColorMapper: (ChartData data, _) => data.color,
//                 xValueMapper: (ChartData data, _) => data.x,
//                 yValueMapper: (ChartData data, _) => data.y)
//           ]),
//         ],
//       ),
//     );
//   }
// }

// class ChartData {
//   ChartData(this.x, this.y, this.color);
//   final String x;
//   final double y;
//   final Color color;
// }
