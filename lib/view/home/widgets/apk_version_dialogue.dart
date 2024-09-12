
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showUpdateDialog({
  required BuildContext context,
  required String localVersion,
  required String storeVersion,
  String dialogTitle = 'Update Available',
  String? dialogText,
  String updateButtonText = 'Update',
  bool allowDismissal = false,
  String dismissButtonText = 'Maybe Later',
  VoidCallback? dismissAction,
}) async {
  final dialogTitleWidget = Text(dialogTitle);
  final dialogTextWidget = Text(
    dialogText ??
        'You can now update this app from $localVersion to $storeVersion',
  );

  final updateButtonTextWidget = Text(updateButtonText);
  updateAction() {
    if (allowDismissal) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  List<Widget> actions = [
    CupertinoDialogAction(
      onPressed: updateAction,
      child: updateButtonTextWidget,
    ),
  ];

  if (allowDismissal) {
    final dismissButtonTextWidget = Text(dismissButtonText);
    dismissAction =
        dismissAction ?? () => Navigator.of(context, rootNavigator: true).pop();
    actions.add(
      CupertinoDialogAction(
        onPressed: dismissAction,
        child: dismissButtonTextWidget,
      ),
    );
  }

  await showDialog(
    context: context,
    barrierDismissible: allowDismissal,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: dialogTitleWidget,
        content: dialogTextWidget,
        actions: actions,
      );
    },
  );
}