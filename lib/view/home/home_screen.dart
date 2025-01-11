import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:telios_2/settings/route/app_router.dart';
import '../../model/model.dart';
import '../../settings/helper/helper.dart';
import '../../settings/theme/colors.dart';
import '../../view_model/view_model.dart';
import '../view.dart';

import 'widgets/lazy_indexed_stack.dart';

class HomeScreen extends StatefulWidget {
  final int tabIndex;
  const HomeScreen({super.key, required this.tabIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(
    length: 4,
    vsync: this,
    initialIndex: _clampIndex(widget.tabIndex),
  )..addListener(_handleTabChanged);
  AnimationController? _fade;

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    if (oldWidget.tabIndex != widget.tabIndex) {
      _tabController.index = _clampIndex(widget.tabIndex);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _clampIndex(int index) => index.clamp(0, 3);

  void _handleTabChanged() {
    _fade?.forward(from: 0);
    setState(() {});
  }

  void handleTabTapped(int index) {
    _tabController.index = index;
    context.go(ScreenPaths.home(tabIndex: _tabController.index));
  }

  bool _isExpanded = true;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchUser();
      Get.find<SurveyController>().fetchSurveyTempDB();
    });

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Center(
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.fetchUser();
                Get.find<SurveyController>().fetchSurveyTempDB();
              },
              child: Column(
                children: [
                  if (Responsive.isDesktop(context))
                    CustomAppBar(
                      tabIndex: _tabController.index,
                      handleTabTapped: handleTabTapped,
                    ),
                  // if (Responsive.isDesktop(context))
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: MediaQuery.of(context).size.height,
                      child: LazyIndexedStack(
                        index: _tabController.index,
                        children: [
                          if (!Responsive.isDesktop(context))
                            HomeMobileTab(
                              tabIndex: _tabController.index,
                              handleTabTapped: handleTabTapped,
                            )
                          else
                            DashboardScreen(),
                          AssignedLevelScreen(handleTabTapped: handleTabTapped),
                          SizedBox(
                            child: Center(child: Text('Trainings')),
                          ),
                          SizedBox(
                            child: Center(child: Text('Courses')),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // if (!Responsive.isDesktop(context))
                  //   HomeMobileTab(
                  //     tabIndex: _tabController.index,
                  //     handleTabTapped: handleTabTapped,
                  //   )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeMobileTab extends StatelessWidget {
  final int tabIndex;
  final Function(int index) handleTabTapped;
  const HomeMobileTab({
    super.key,
    required this.tabIndex,
    required this.handleTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: Responsive.isTablet(context) ? 500 : double.maxFinite,
      child: Center(
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
                  .copyWith(bottom: 20),
              child: SizedBox(
                child: Row(children: [
                  GetBuilder<AuthController>(builder: (c) {
                    if (!c.isTrapdor) {
                      return HomeButtonWidget(
                        width: width,
                        name: "Survey",
                        icon: Icons.fingerprint,
                        iconName: 'assets/icons/activity.svg',
                        onTap: () => handleTabTapped(1),
                      );
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
                    builder: (context) => const PendingPage(),
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
    );
  }

  void _showPopupCard(BuildContext context) {
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
