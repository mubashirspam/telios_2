import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String name;
  final VoidCallback? onPressed;
  final double? boderRadius;
  final Color? bgColor;
  final Color? bgInColor;
  final Color? fgColor;
  final Color? fgIColor;
  final bool isLoading;

  const TextButtonWidget({
    super.key,
    this.boderRadius,
    required this.name,
    required this.onPressed,
    this.bgColor,
    this.bgInColor,
    this.fgColor,
    this.fgIColor,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.resolveWith<Size>(
            (states) => const Size(double.minPositive, 45)),
        padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<WidgetState> states) => const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 25,
          ),
        ),

        backgroundColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return bgInColor ?? Colors.blue;
          }

          return bgColor ?? Colors.blueAccent;
        }),
        foregroundColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return fgIColor ?? Colors.white;
          }

          return fgColor ?? Colors.blue;
        }),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(boderRadius ?? 6),
          );
        }),
        // elevation: WidgetStateProperty.resolveWith((states) => 1),
        animationDuration: const Duration(milliseconds: 30),
      ),
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: bgColor ?? Colors.white,
                  color: fgColor ?? Colors.blue,
                ),
              ),
            )
          : Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
    );
  }
}
