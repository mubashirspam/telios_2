import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/view_model/view_model.dart';
import '../../settings/settings.dart';
import '../widgets/widgets.dart';
import 'widgets/assigned_level_item.dart';

class AssignedLevelScreen extends StatelessWidget {
  final Function(int index) handleTabTapped;
  const AssignedLevelScreen({super.key, required this.handleTabTapped});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<LevelController>().fetchAssignedLevel();
    });
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!Responsive.isDesktop(context))
              SafeArea(
                bottom: false,
                left: false,
                right: false,
                child: ContainerWidget(
                  child: Row(
                    children: [
                      BackButtonWidget(
                        onPress: () => handleTabTapped(0),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Survey",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    ],
                  ),
                ),
              ),

            // if (Responsive.isDesktop(context))
            Expanded(
              child: GetBuilder(
                  init: LevelController(),
                  builder: (c) {
                    if (c.response.state == ResponseState.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (c.response.state == ResponseState.error) {
                      return const Center(child: Text("data not found"));
                    }
                    if (c.response.state == ResponseState.completed) {
                      final assignedLevel = c.response.data;
                      if (assignedLevel == null || assignedLevel.isEmpty) {
                        return const Center(child: Text("data not found"));
                      }
                      return GridView.builder(
                        padding: const EdgeInsets.all(16).copyWith(top: 0),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          crossAxisSpacing: 15,
                          mainAxisExtent: 210,
                          mainAxisSpacing: 15,
                          maxCrossAxisExtent: 450,
                        ),
                        itemCount: assignedLevel.length,
                        itemBuilder: (context, index) {
                          final level = assignedLevel[index];
                          return AssignedLevelItem(
                            level: level,
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
