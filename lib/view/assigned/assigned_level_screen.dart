import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/view_model/view_model.dart';
import '../../settings/helper/enums.dart';
import '../widgets/widgets.dart';
import 'widgets/assigned_level_item.dart';

class AssignedLevelScreen extends StatelessWidget {
  const AssignedLevelScreen({super.key});

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
            SafeArea(
              bottom: false,
              left: false,
              right: false,
              child: Padding(
                padding: const EdgeInsets.all(20).copyWith(bottom: 0),
                child: SizedBox(
                  child: Row(
                    children: [
                      const BackButtonWidget(),
                      const SizedBox(width: 20),
                      Text(
                        "Statistics",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Assigned Levels",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
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
                      return SizedBox(
                        width: double.maxFinite,
                        child: RefreshIndicator(
                          onRefresh: () async {
                            c.fetchAssignedLevel();
                          },
                          child: ListView.builder(
                            itemCount: assignedLevel.length,
                            padding: const EdgeInsets.all(15).copyWith(top: 0),
                            itemBuilder: (context, index) => AssignedLevelItem(
                              level: assignedLevel[index],
                            ),
                          ),
                        ),
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
