import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';

enum AlertDialogType { warning, loading, info, success }

class CustomAlertDialog extends StatelessWidget {
  final AlertDialogType type;
  final String title;
  final String message;
  final VoidCallback? onConfirm;
  final Widget? customContent;
  final bool? isLoading;

  const CustomAlertDialog(
      {super.key,
      required this.type,
      required this.title,
      required this.message,
      this.customContent,
      this.isLoading,
      this.onConfirm});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    IconData icon;

    switch (type) {
      case AlertDialogType.warning:
        backgroundColor = Colors.amber.shade400;
        icon = Icons.warning;
        break;
      case AlertDialogType.loading:
        backgroundColor = Colors.blue;
        icon = Icons.refresh;
        break;
      case AlertDialogType.info:
        backgroundColor = Colors.blue;
        icon = Icons.info;
        break;
      case AlertDialogType.success:
        backgroundColor = Colors.green;
        icon = Icons.check;
        break;
    }

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: customContent ??
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 64, color: backgroundColor),
              const SizedBox(height: 10),
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black)),
              const SizedBox(height: 10),
            ],
          ),
      actions: <Widget>[
        SizedBox(
          child: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.textPrimary,
                    foregroundColor: AppColor.backround,
                  ),
                  onPressed: isLoading ?? false
                      ? () {}
                      : () {
                          Navigator.of(context).pop();
                        },
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    foregroundColor: AppColor.backround,
                  ),
                  onPressed: onConfirm,
                  child: isLoading ?? false
                      ? const SizedBox(
                          child: SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              color: AppColor.backround,
                              backgroundColor: AppColor.primary,
                            ),
                          ),
                        )
                      : const Text('Yes Sure'),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        )
      ],
    );
  }
}


    void showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.black,
      margin: const EdgeInsets.all(30),
    );
  }