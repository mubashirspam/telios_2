

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/model/model.dart';
import 'package:telios_2/settings/settings.dart';
import 'package:telios_2/view/view.dart';
import 'package:telios_2/view_model/view_model.dart';

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
  bool _showSearchBar = false;

  @override
  Widget build(BuildContext context) {
    final LevelController controller = Get.find<LevelController>();
    final levelKey = widget.assignedLevel.levelKey!;
    final unitId = widget.assignedLevel.unitId!;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchMapLevel(
          levelKey, unitId, );

      // Get.find<SurveyController>().syncSurveyAnswers(levelKey);
    });

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (Responsive.isDesktop(context)) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerWidget(
                  margin: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                appRouter.pop();
                              },
                              icon: const Icon(Icons.arrow_back)),
                          SizedBox(width: 15),
                          Center(
                            child: title(),
                          ),
                        ],
                      )),
                      SizedBox(
                        child: Row(
                          children: [
                            _buildSearchBar(),
                            SizedBox(width: 15),
                            IconButton(
                              style: IconButton.styleFrom(
                                backgroundColor: const Color(0xFFF7F8F9),
                                foregroundColor: AppColor.primary,
                              ),
                              icon: const Icon(Icons.filter_alt_outlined),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                Expanded(child: _buildMapView(controller)),
              ],
            );
          } else {
            // Mobile layout
            return SafeArea(
              child: Column(
                children: [
                  ContainerWidget(
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackButtonWidget(),
                          const SizedBox(width: 15),
                          _showSearchBar
                              ? Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(child: _buildSearchBar()),
                                      SizedBox(width: 15),
                                      IconButton(
                                        style: IconButton.styleFrom(
                                          backgroundColor: Color(0xFFF7F8F9),
                                          foregroundColor: AppColor.primary,
                                        ),
                                        icon: const Icon(
                                            Icons.filter_alt_outlined),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                )
                              : Expanded(child: title()),
                          if (_showSearchBar) SizedBox(width: 10),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColor.primary,
                            ),
                            icon: _showSearchBar
                                ? const Icon(Icons.search_off_outlined)
                                : const Icon(Icons.search_outlined),
                            onPressed: () {
                              setState(() {
                                _showSearchBar = !_showSearchBar;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: _buildMapView(controller)),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget title() => SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.assignedLevel.levelName!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              widget.assignedLevel.geoJsonLevel!,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      );

  Widget _buildSearchBar() {
    return SearchBar(
      constraints:
          const BoxConstraints(maxWidth: 300, minWidth: 150, minHeight: 40),
      controller: searchQuery,
      onChanged: (value) {
        Get.find<LevelController>().searchMapLevel(searchQuery.text);
      },
      hintText: "Search",
      hintStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (states) => TextStyle(fontSize: 12),
      ),
      elevation: WidgetStateProperty.resolveWith<double>(
        (states) => 0,
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (states) => Color(0xFFF7F8F9),
      ),
    );
  }

  Widget _buildMapView(LevelController controller) {
    return GetBuilder(
      init: LevelController(),
      builder: (c) {
        if (c.mapResponse.state == ResponseState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (c.mapResponse.state == ResponseState.error) {
          return Center(child: Text(c.mapResponse.failure!.message));
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
                controller.fetchMapLevel(widget.assignedLevel.levelKey!,
                    widget.assignedLevel.unitId!,);
              },
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 15,
                  mainAxisExtent: 250,
                  mainAxisSpacing: 15,
                  maxCrossAxisExtent: 400,
                ),
                itemCount: levels.length,
                padding: const EdgeInsets.all(15).copyWith(top: 0),
                itemBuilder: (context, index) {
                  return KeyedSubtree(
                    key: ValueKey(levels[index].levelKey),
                    child: MapLevelItem(
                      surveyLevelCount: levels[index].surveyLevelCount ?? 1,
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
      },
    );
  }
}
