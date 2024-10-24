import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:telios_2/model/model.dart';
import 'package:telios_2/view_model/view_model.dart';
import '../../../settings/settings.dart';
import 'dart:developer';

class SfMapWidget extends StatelessWidget {
  final int selectedIndex;
  final List<ListingModel> levels;
  final Uint8List geoJsonBytes;
  final String shapeDataField;
  final List<MapColorMapper> colorMapper;

  const SfMapWidget({
    super.key,
    required this.geoJsonBytes,
    required this.selectedIndex,
    required this.levels,
    required this.shapeDataField,
    required this.colorMapper,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: BuildMap(
                  colorMappers: colorMapper,
                  levels: levels,
                  shapeDataField: shapeDataField,
                  geoJsonBytes: geoJsonBytes,
                  selectedIndex: selectedIndex,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BuildMap extends StatefulWidget {
  final String shapeDataField;
  final List<ListingModel> levels;
  final Uint8List geoJsonBytes;
  final int selectedIndex;
  final List<MapColorMapper> colorMappers;

  const BuildMap({
    required this.shapeDataField,
    required this.geoJsonBytes,
    required this.levels,
    required this.selectedIndex,
    required this.colorMappers,
    super.key,
  });

  @override
  State<BuildMap> createState() => _BuildMapState();
}

class _BuildMapState extends State<BuildMap> {
  late List<ListingModel> _levels;
  late Uint8List _bytesData;
  late MapShapeSource _dataSource;
  late List<MapColorMapper> _colorMappers;
  late int _selectedIndex;

  @override
  void initState() {
    _bytesData = widget.geoJsonBytes;
    _levels = widget.levels;
    _colorMappers = widget.colorMappers;
    _selectedIndex = widget.selectedIndex;

    _dataSource = MapShapeSource.memory(
      _bytesData,
      shapeDataField: widget.shapeDataField,
      dataCount: _levels.length,
      primaryValueMapper: (int index) => _levels[index].name,
      shapeColorValueMapper: (int index) => _levels[index].category.toString(),
      shapeColorMappers: _colorMappers,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    log("Selected Index $_selectedIndex ::::::::  ${widget.levels.length}");

    return SfMaps(
      layers: [
        MapShapeLayer(
          source: _dataSource,
          showDataLabels: true,
          loadingBuilder: (BuildContext context) {
            return const CircularProgressIndicator(
              strokeWidth: 3,
            );
          },
          selectedIndex: Get.find<LevelController>().selectedLevel.value,
          color: AppColor.primary,
          onSelectionChanged: (int index) {
            Get.find<LevelController>().selectALevel(index);
          },
          strokeColor: AppColor.primary,
          strokeWidth: 1,
          selectionSettings: const MapSelectionSettings(
            color: AppColor.primary,
            strokeColor: Colors.black,
            strokeWidth: 1,
          ),
          dataLabelSettings: MapDataLabelSettings(
            overflowMode: MapLabelOverflow.ellipsis,
            textStyle: TextStyle(
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.normal,
              fontSize: themeData.textTheme.bodySmall!.fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
