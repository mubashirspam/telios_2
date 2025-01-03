import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/model/model.dart';
import 'package:telios_2/settings/settings.dart';
import 'package:telios_2/view_model/view_model.dart';
import '../widgets/widgets.dart';
import 'widgets/map_level_item.dart';

class MapLevelScreen extends StatefulWidget {
  final AssignedLevel assignedLevel;
  final String id;

  const MapLevelScreen(
      {super.key, required this.assignedLevel, required this.id});

  @override
  State<MapLevelScreen> createState() => _MapLevelScreenState();
}

class _MapLevelScreenState extends State<MapLevelScreen> {
  TextEditingController searchQuery = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final LevelController controller = Get.find<LevelController>();
    final levelKey = widget.assignedLevel.levelKey!;
    final unitId = widget.assignedLevel.unitId!;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchMapLevel(levelKey, unitId);

      // Get.find<SurveyController>().syncSurveyAnswers(levelKey);
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
              child: ContainerWidget(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            appRouter.pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: AppColor.primary,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.assignedLevel.levelName!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              widget.assignedLevel.geoJsonLevel!,
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ],
                    )),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SearchBar(
                            constraints: const BoxConstraints(
                                maxWidth: 400, minHeight: 40),
                            controller: searchQuery,
                            onChanged: (value) {
                              Get.find<LevelController>()
                                  .searchMapLevel(searchQuery.text);
                            },
                            hintText: "Search",
                            hintStyle:
                                WidgetStateProperty.resolveWith<TextStyle>(
                              (states) => TextStyle(fontSize: 12),
                            ),
                            elevation: WidgetStateProperty.resolveWith<double>(
                              (states) => 0,
                            ),
                            backgroundColor:
                                WidgetStateProperty.resolveWith<Color>(
                              (states) => Color(0xFFF7F8F9),
                            ),
                          ),
                          SizedBox(width: 15),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Color(0xFFF7F8F9),
                            ),
                            icon: const Icon(Icons.filter_alt_outlined),
                            onPressed: () {},
                            color: AppColor.primary,
                          )
                        ],
                      ),
                    ),
                    SizedBox()
                  ],
                ),
              ),
            ),
            Expanded(
              child: GetBuilder(
                  init: LevelController(),
                  builder: (c) {
                    if (c.mapResponse.state == ResponseState.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (c.mapResponse.state == ResponseState.error) {
                      return Center(
                          child: Text(c.mapResponse.failure!.message));
                    }
                    if (c.mapResponse.state == ResponseState.completed) {
                      final levels = c.filterdMapLevel;

                      if (levels.isEmpty) {
                        return const Center(child: Text("data not found"));
                      }
                      // return GridView.builder(
                      //   gridDelegate:
                      //       const SliverGridDelegateWithMaxCrossAxisExtent(
                      //     crossAxisSpacing: 20,
                      //     mainAxisExtent: 250,
                      //     mainAxisSpacing: 20,
                      //     maxCrossAxisExtent: 400,
                      //   ),
                      //   itemCount: 20,
                      //   padding: const EdgeInsets.all(20).copyWith(top: 0),
                      //   itemBuilder: (context, index) {
                      //     return ShimmerCard();
                      //   },
                      // );
                      return SizedBox(
                        width: double.maxFinite,
                        child: RefreshIndicator(
                          onRefresh: () async {
                            controller.fetchMapLevel(levelKey, unitId);
                          },
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              crossAxisSpacing: 20,
                              mainAxisExtent: 250,
                              mainAxisSpacing: 20,
                              maxCrossAxisExtent: 400,
                            ),
                            itemCount: levels.length,
                            padding: const EdgeInsets.all(20).copyWith(top: 0),
                            itemBuilder: (context, index) {
                              return KeyedSubtree(
                                key: ValueKey(levels[index].levelKey),
                                child: MapLevelItem(
                                  surveyLevelCount:
                                      levels[index].surveyLevelCount ?? 1,
                                  mapLevel: levels[index],
                                  pieChartData: c.mapLevels,
                                ),
                              );
                            },
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
