import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/model/map_level_model.dart';

import '../../../view_model/levels/level_controller.dart';
import '../../widgets/back_button_widget.dart';

class AppbarWidget extends StatelessWidget {
  final MapLevel level;
  const AppbarWidget({
    super.key,
    required this.level,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          child: Row(
            children: [
              const BackButtonWidget(),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    level.levelName!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    level.levelKey!,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              Spacer(),
              Obx(
                () => IconButton(
                  onPressed: () {
                    Get.find<LevelController>().selectMap();
                  },
                  icon: Icon(
                    Get.find<LevelController>().isMapSelected.value
                        ? Icons.map
                        : Icons.list,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
