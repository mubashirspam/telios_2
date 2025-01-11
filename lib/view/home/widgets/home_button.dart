
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telios_2/settings/helper/responsive.dart';
import 'package:telios_2/settings/theme/colors.dart';

class HomeButtonWidget extends StatelessWidget {
  const HomeButtonWidget({
    super.key,
    required this.width,
    required this.icon,
    required this.name,
    required this.onTap,
    this.iconName,
  });

  final double width;
  final IconData icon;
  final String name;
  final VoidCallback onTap;
  final String? iconName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height:
              Responsive.isMobile(context) ? (width - 40) / 3 : (500 - 40) / 3,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 0,
                offset: Offset(0, 0),
                spreadRadius: -1,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 70,
                height: 70,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                decoration: ShapeDecoration(
                  gradient: const RadialGradient(
                    center: Alignment(-0.35, 0.44),
                    radius: 0.60,
                    colors: [
                      AppColor.secondary,
                      AppColor.primary,
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(54),
                  ),
                ),
                child: Center(
                  child: iconName != null
                      ? SvgPicture.asset(
                          iconName!,
                          width: 30,
                        )
                      : Icon(
                          icon,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}