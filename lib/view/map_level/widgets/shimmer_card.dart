import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Column(
                      children: [
                        box(double.maxFinite, 20),
                        SizedBox(height: 10),
                        box(double.maxFinite, 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 30),
                box(50, 50)
              ],
            ),
          ),
          box(double.maxFinite, 30),
          SizedBox(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: box(200, 200),
                ),
                SizedBox(
                  child: Column(
                    children: List.generate(
                        5,
                        (index) => Row(
                              children: [
                                box(20, 20),
                                SizedBox(width: 10),
                                box(100, 20),
                              ],
                            )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget box(double width, double height) => SizedBox(
        width: width,
        height: height,
        child: ColoredBox(color: Colors.grey.shade300),
      );
}
