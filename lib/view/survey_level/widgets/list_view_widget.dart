import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/settings/helper/utils.dart';
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

                  final Color cardColor =
                      categoryColorMap[level.category] ?? Colors.white;

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
                      subtitle: Text(level.id,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: isActive
                                        ? AppColor.backround
                                        : AppColor.textPrimary,
                                  )),
                      trailing: Icon(
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

