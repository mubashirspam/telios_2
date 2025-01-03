import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;


  const ContainerWidget({
    super.key,
    this.width,
    this.height,
    this.child,
    this.margin = const EdgeInsets.all(10),
    this.padding = const EdgeInsets.all(10),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      height: height,
      padding: padding,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: child,
    );
  }
}
