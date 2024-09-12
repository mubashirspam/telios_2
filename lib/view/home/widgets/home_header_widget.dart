import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telios_2/model/model.dart';

import '../../../settings/settings.dart';

class HomeHeaderWidget extends StatelessWidget {
  final UserData user;
  const HomeHeaderWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColor.primary,
            AppColor.secondary,
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19FFFFFF),
            blurRadius: 0,
            offset: Offset(0, 0),
            spreadRadius: -1,
          )
        ],
      ),
      padding: Responsive.isMobile(context)
          ? const EdgeInsets.all(15)
          : const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: ColoredBox(
                      color: Colors.white,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: 45,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SvgPicture.asset(
                  "assets/images/logo_typ.svg",
                  height: 20,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                Spacer(),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      InkWell(
                        highlightColor: Colors.red,
                        hoverColor: Colors.yellow,
                        onTap: () {},
                        borderRadius: BorderRadius.circular(50),
                        radius: 25,
                        child: const CircleAvatar(
                          backgroundColor: Colors.amber,
                          radius: 25,
                          child: Icon(
                            Icons.sync,
                            color: Colors.black, // Change the color as needed
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Synced',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: user.userProfileAvatar == null
                        ? const SizedBox()
                        : CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              user.userProfileAvatar!,
                            )),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.userName ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                        ),
                        Text(
                          user.userEmail ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RotatingIcon extends StatefulWidget {
  const RotatingIcon({super.key});

  @override
  _RotatingIconState createState() => _RotatingIconState();
}

class _RotatingIconState extends State<RotatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.1415, // 2*pi radians = 360 degrees
          child: const CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 25,
            child: Icon(
              Icons.sync,
              color: Colors.black, // Change the color as needed
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
