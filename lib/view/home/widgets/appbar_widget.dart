import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';
import '../../../settings/settings.dart';
import '../../../view_model/survey/survey.dart';
import '../../widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final int tabIndex;
  final Function(int) handleTabTapped;

  const CustomAppBar({
    super.key,
    this.tabIndex = 0,
    required this.handleTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> tabTitles = [
      'Dashboard',
      'Survey',
      'Training',
      'Course'
    ];

    return ContainerWidget(
      width: double.maxFinite,
      height: 70,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          // Logo
          Image.asset(
            "assets/images/logo.png",
            width: 40,
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(
            "assets/images/logo_typ.svg",
            height: 16,
            colorFilter:
                const ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
          ),
          const Spacer(),

          // Tab bar

          Container(
            height: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            decoration: const BoxDecoration(
              color: Color(0xFFF7F8F9),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Row(
              children: tabTitles.asMap().entries.map((entry) {
                final index = entry.key;
                final title = entry.value;
                final isSelected = index == tabIndex;
                return _buildTab(title, isSelected, onTap: () {
                  handleTabTapped(index);
                });
              }).toList(),
            ),
          ),
          const Spacer(),

          GetBuilder<SurveyController>(builder: (s) {
            return TextButton.icon(
              onPressed: () {
                s.postSurveyAnswerRemote();
              },
              icon: const Icon(Icons.sync, size: 18, color: Colors.black),
              label: Text(
                s.u.state == ResponseState.loading
                    ? 'Syncing'
                    : s.presentDataForSync.value
                        ? 'Sync'
                        : 'Synced',
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            );
          }),
          const SizedBox(width: 16),
          // Profile picture
          const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1499714608240-22fc6ad53fb2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=76&q=80',
            ),
            radius: 20,
          ),
        ],
      ),
    );
  }
}

Widget _buildTab(String title, bool isSelected, {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ),
  );
}
