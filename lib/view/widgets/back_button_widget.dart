
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final bool? isForward;
  final IconData? icon;
  const BackButtonWidget({super.key, this.onPress, this.isForward, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress ??
          () {
            Navigator.pop(context);
          },
      child: Container(
        width: 50,
        height: 50,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFE8ECF4)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Icon(
            icon ??
                (isForward ?? false ? Icons.chevron_right : Icons.chevron_left),
            size: 26,
          ),
        ),
      ),
    );
  }
}
