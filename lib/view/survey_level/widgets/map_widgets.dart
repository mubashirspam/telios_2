
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:telios_2/model/model.dart';
import 'package:telios_2/view_model/view_model.dart';
import '../../../settings/settings.dart';

class SfMapWidget extends StatelessWidget {
  final int selectedIndex;
  final List<ListingModel> levels;
  final Uint8List geoJsonBytes;
  final String shapeDataField;

  const SfMapWidget({
    super.key,
    required this.geoJsonBytes,
    required this.selectedIndex,
    required this.levels,
    required this.shapeDataField,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          child: Column(
            children: [
              Expanded(
                child: BuildMap(
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

  // final List<MapColorMapper>? shapeColorMappers;
  // final dynamic Function(int)? shapeColorValueMapper;

  const BuildMap({
    required this.shapeDataField,
    required this.geoJsonBytes,
    required this.levels,
    // required this.shapeColorMappers,
    // required this.shapeColorValueMapper,
    required this.selectedIndex,
    super.key,
  });

  @override
  State<BuildMap> createState() => _BuildMapState();
}

class _BuildMapState extends State<BuildMap> {
  late List<ListingModel> _levels;
  late Uint8List _bytesData;
  late MapShapeSource _dataSource;

  @override
  void initState() {
    _bytesData = widget.geoJsonBytes;
    _levels = widget.levels;

    _dataSource = MapShapeSource.memory(
      _bytesData,
      shapeDataField: widget.shapeDataField,
      dataCount: _levels.length,
      primaryValueMapper: (int index) => _levels[index].name,
      shapeColorValueMapper: (int index) => _levels[index].category,
      shapeColorMappers: colorMappers,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

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
          selectedIndex: widget.selectedIndex,
          color: AppColor.primary,
          onSelectionChanged: (int index) {
            Get.find<LevelController>().selectALevel(index);
          },
          strokeColor: AppColor.primary,
          strokeWidth: 2,
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

final List<MapColorMapper> colorMappers = <MapColorMapper>[
  const MapColorMapper(value: '', color: Colors.white),
  const MapColorMapper(value: 'hc', color: AppColor.hc),
  const MapColorMapper(value: 'pc', color: AppColor.pc),
  const MapColorMapper(value: 'mc', color: AppColor.mc),
  const MapColorMapper(value: 'av', color: AppColor.av)
  // const MapColorMapper(
  //   from: 1000,
  //   to: 200000,
  //   color: Colors.red,
  //   minOpacity: 0.3,
  //   maxOpacity: 1.0,
  // ),
  // const MapColorMapper(
  //   from: 200001,
  //   to: 400000,
  //   color: Colors.green,
  //   minOpacity: 0.3,
  //   maxOpacity: 1.0,
  // ),
  // const MapColorMapper(
  //   from: 400001,
  //   to: 600000,
  //   color: Colors.blue,
  //   minOpacity: 0.3,
  //   maxOpacity: 1.0,
  // ),
  // const MapColorMapper(
  //   from: 600001,
  //   to: 800000,
  //   color: Colors.yellow,
  //   minOpacity: 0.3,
  //   maxOpacity: 1.0,
  // ),
  // const MapColorMapper(
  //   from: 800001,
  //   to: 1000000,
  //   color: Colors.purple,
  //   minOpacity: 0.3,
  //   maxOpacity: 1.0,
  // ),
];
