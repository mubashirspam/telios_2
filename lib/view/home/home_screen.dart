import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:telios_2/model/model.dart';
import 'package:telios_2/settings/route/app_router.dart';
import '../../settings/helper/helper.dart';
import '../../settings/theme/colors.dart';
import '../../view_model/view_model.dart';
import 'pending_page.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final AuthController controller = Get.find<AuthController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchUser();
      Get.find<SurveyController>().fetchSurveyTempDB();
    });

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SizedBox(
          width: Responsive.isMobile(context) ? double.maxFinite : 500,
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.fetchUser();
              Get.find<SurveyController>().fetchSurveyTempDB();
            },
            child: ListView(
              children: [
                GetBuilder<AuthController>(builder: (c) {
                  if (c.userResponse.state == ResponseState.loading) {
                    return Shimmer(
                      gradient: LinearGradient(colors: [
                        AppColor.primary.withOpacity(0.3),
                        AppColor.pc.withOpacity(0.1)
                      ]),
                      child: HomeHeaderWidget(
                        user: UserData(),
                      ),
                    );
                  }

                  if (c.userResponse.state == ResponseState.error) {
                    return const Text("data");
                  }
                  if (c.userResponse.state == ResponseState.completed) {
                    if (c.userResponse.data!
                            .teliosPersonVsTeliosSettingsstaticApkVersion !=
                        apkVersion) {
                      Future.delayed(const Duration(milliseconds: 100))
                          .then((onValue) {
                        showUpdateDialog(
                          context: context,
                          localVersion: apkVersion,
                          storeVersion: c.userResponse.data!
                              .teliosPersonVsTeliosSettingsstaticApkVersion!,
                        );
                      });
                    }

                    return HomeHeaderWidget(user: c.userResponse.data!);
                  }
                  return const Text("data");
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(bottom: 70),
                  child: SizedBox(
                    child: Row(children: [
                      GetBuilder<AuthController>(builder: (c) {
                        if (!c.isTrapdor) {
                          return HomeButtonWidget(
                              width: width,
                              name: "Survey",
                              icon: Icons.fingerprint,
                              iconName: 'assets/icons/activity.svg',
                              onTap: () =>
                                  Get.toNamed(RouterName.assignedLevel));
                        }
                        return const SizedBox();
                      }),
                      const SizedBox(width: 20),
                      HomeButtonWidget(
                        onTap: () {},
                        width: width,
                        name: "Trainings",
                        icon: Icons.model_training_sharp,
                      ),
                      const SizedBox(width: 20),
                      HomeButtonWidget(
                        onTap: () {},
                        width: width,
                        name: "Courses",
                        icon: Icons.computer_rounded,
                      ),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PendingPage(),
                      ),
                    );
                  },
                  child: button(
                    context,
                    "Pending data for sync",
                    Icons.sync,
                  ),
                ),
                button(
                  context,
                  "Settings",
                  Icons.settings,
                ),
                InkWell(
                  onTap: () async {
                    _showPopupCard(context);
                  },
                  child: button(
                    context,
                    "Log out",
                    Icons.logout,
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _showPopupCard(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          onConfirm: () {
            final c = Get.find<AuthController>();
            c.logout();
          },
          type: AlertDialogType.warning, // Change the type as needed
          title: 'Are you sure you want to log out? ',
          message:
              "Logging out will end your current session, \nand you'll need to sign in again \nto access your account.\nPlease confirm your decision to log out",
        );
      },
    );
  }

  Widget button(
    BuildContext context,
    String name,
    IconData icon1,
  ) =>
      Container(
        margin: const EdgeInsets.all(20).copyWith(top: 0),
        padding: const EdgeInsets.all(20),
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
        child: Row(
          children: [
            Icon(icon1),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                name,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(),
              ),
            ),
            const Icon(Icons.arrow_forward),
          ],
        ),
      );
}

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
