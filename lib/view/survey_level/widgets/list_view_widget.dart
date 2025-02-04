import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/view/view.dart';
import '../../../model/model.dart';
import '../../../settings/helper/dialogues.dart';
import '../../../settings/helper/responsive.dart';
import '../../../settings/theme/colors.dart';
import '../../../view_model/view_model.dart';

class ListViewWidget extends StatelessWidget {
  final MapLevel mapLevel;

  final List<ListingModel> levels;
  const ListViewWidget({
    super.key,
    required this.levels,
    required this.mapLevel,
  });

  @override
  Widget build(BuildContext context) {
    final categoryMap = Get.find<SurveyController>().categoryList;
    return ContainerWidget(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(15)
          .copyWith(left: Responsive.isMobile(context) ? 15 : 0),
      width: Responsive.isMobile(context) ? double.maxFinite : 350,
      child: Column(
        children: [
          GetBuilder(
            init: Get.find<LevelController>(),
            builder: (controller) => Expanded(
              child: ListView.builder(
                itemCount: levels.length + 1,
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  if (index == levels.length) {
                    // Check if it's the last item
                    return AddLevelButton(
                      mapLevel: mapLevel,
                      count: levels.length + 1,
                    );
                  } else {
                    final level = levels[index];

                    final bool isActive =
                        controller.selectedLevel.value == index;
                    Color cardColor = AppColor.backround;

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
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      shadowColor: Colors.black26,
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
                                              color: Colors.blueGrey.shade100,
                                            )),

                                        padding: const EdgeInsets.all(5),
                                        label: Text(
                                          "${entry.question}: ${entry.answer}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      );
                                    }),
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
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddLevelButton extends StatelessWidget {
  final MapLevel mapLevel;
  final int count;
  const AddLevelButton({
    super.key,
    required this.mapLevel,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final c = Get.find<LevelController>();
    return ElevatedButton.icon(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return Obx(() => CustomAlertDialog(
                    title: 'Create a New Level',
                    message: '',
                    isLoading: c.addMissingLevel.value,
                    onConfirm: () {
                      final levelKey =
                          "${mapLevel.levelKey}-${DateTime.now().millisecondsSinceEpoch}";

                      log(levelKey);
                      c.addmissingLevel(
                          context: context,
                          mapLevels: mapLevel,
                          count: count,
                          surveyLevel: SurveyLevel(
                            levelName: nameController.text,
                            levelKey: levelKey,
                            assignedLevelKey: mapLevel.assignedLevelKey ?? '',
                            assignedLevelName: mapLevel.assignedLevelName,
                            geoJsonLevelKey: mapLevel.levelKey ?? '',
                            geoJsonLevelName: mapLevel.levelName,
                          ));
                    },
                    type: AlertDialogType.warning,
                    customContent: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        const Text("Create a New Level ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        const Text(
                            "Please enter the level name and click 'Save' \n if you have created a new level. \n This action cannot be undone.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black)),
                        const SizedBox(height: 20),
                        SizedBox(
                          child: TextFieldWidget(
                            textEditingController: nameController,
                            fillColor: Colors.white,
                            hintText: "Enter level name",
                            labelText: "Level name",
                            keyboardType: TextInputType.name,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a level name';
                              }

                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("Add missing level"));
  }
}
