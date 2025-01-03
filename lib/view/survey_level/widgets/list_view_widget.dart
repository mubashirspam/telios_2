import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/model.dart';
import '../../../settings/helper/responsive.dart';
import '../../../settings/theme/colors.dart';
import '../../../view_model/view_model.dart';

class ListViewWidget extends StatelessWidget {
  final List<ListingModel> levels;
  const ListViewWidget({
    super.key,
    required this.levels,
  });

  @override
  Widget build(BuildContext context) {
    final categoryMap = Get.find<SurveyController>().categoryList;
    return SizedBox(
      width: Responsive.isMobile(context) ? double.maxFinite : 350,
      child: Column(
        children: [
          GetBuilder(
            init: Get.find<LevelController>(),
            builder: (controller) => Expanded(
              child: ListView.builder(
                itemCount: levels.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(15).copyWith(top: 0),
                itemBuilder: (context, index) {
                  final level = levels[index];

                  final bool isActive = controller.selectedLevel.value == index;
                  Color cardColor = Colors.white;

                  for (var c in categoryMap) {
                    if (c.questionId == level.category &&
                        c.categoryColor != null) {
                      cardColor = Color(c.categoryColor!);
                      break;
                    }
                  }

                  return Card(
                    margin: const EdgeInsets.only(bottom: 15),
                    color: isActive ? AppColor.primary : cardColor,
                    surfaceTintColor: Colors.transparent,
                    child: ListTile(
                      onTap: () {
                        Get.find<LevelController>().selectALevel(index);
                      },
                      title: Text(
                        level.name,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: isActive
                                      ? AppColor.backround
                                      : AppColor.textPrimary,
                                ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: Text(level.id,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: isActive
                                          ? AppColor.backround
                                          : AppColor.textPrimary,
                                    )),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(height: 10),
                          SizedBox(
                            width: double.maxFinite,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              runSpacing: 5,
                              spacing: 5,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                if (levels[index].answers != null)
                                  ...levels[index].answers!.map((entry) {
                                    return Chip(
                                      // decoration: BoxDecoration(
                                      //     color: Color(int.parse(entry.color)),
                                      //     border: Border.all(
                                      //         width: 1,
                                      //         color: Colors.blueGrey)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          side: BorderSide(
                                          color:    Colors.blueGrey.shade100,
                                          )),
                                    

                                      padding: const EdgeInsets.all(5),
                                      label: Text(
                                        "${entry.question}: ${entry.answer}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                              ],
                            ),
                          )
                        ],
                      ),
                      trailing: levels[index].answers != null &&
                              levels[index].answers!.isNotEmpty
                          ? null
                          : Icon(
                              Icons.chevron_right_rounded,
                              color: isActive
                                  ? AppColor.backround
                                  : AppColor.textPrimary,
                            ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
