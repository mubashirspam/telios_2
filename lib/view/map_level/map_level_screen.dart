import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/model/model.dart';
import 'package:telios_2/view_model/view_model.dart';
import '../../settings/helper/enums.dart';
import '../widgets/widgets.dart';
import 'widgets/map_level_item.dart';

class MapLevelScreen extends StatefulWidget {
  final AssignedLevel assignedLevel;
  const MapLevelScreen({super.key, required this.assignedLevel});

  @override
  State<MapLevelScreen> createState() => _MapLevelScreenState();
}

class _MapLevelScreenState extends State<MapLevelScreen> {
  TextEditingController searchQuery = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final LevelController controller = Get.find<LevelController>();
    final d = widget.assignedLevel.levelKey!;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchMapLevel(d);
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
                            widget.assignedLevel.levelName!,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            widget.assignedLevel.geoJsonLevel!,
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        suffixIcon: InkWell(
                          child: const Icon(Icons.search),
                          onTap: () {
                            Get.find<LevelController>()
                                .searchMapLevel(searchQuery.text);
                            searchQuery.clear();
                          },
                        ),
                        hintText: "Search",
                        textEditingController: searchQuery,
                        onChanged: (value) {
                          Get.find<LevelController>()
                              .searchMapLevel(searchQuery.text);
                        },
                        fillColor: Colors.white,
                        keyboardType: TextInputType.name,
                        validate: (_) {
                          return;
                        },
                      ),
                    ),

                    // BackButtonWidget(
                    //   onPress: () {},
                    //   icon: Icons.filter_alt_outlined,
                    // ),
                  ],
                )),
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
                      return const Center(child: Text("data not found"));
                    }
                    if (c.mapResponse.state == ResponseState.completed) {
                      final levels = c.filterdMapLevel;

                      if (levels.isEmpty) {
                        return const Center(child: Text("data not found"));
                      }
                      return SizedBox(
                        width: double.maxFinite,
                        child: RefreshIndicator(
                          onRefresh: () async {
                            controller.fetchMapLevel(d);
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
