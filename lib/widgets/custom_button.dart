import 'package:musify/animations/bottom_animation.dart';
import 'package:musify/configs/app_dimensions.dart';
import 'package:musify/configs/app_theme.dart';
import 'package:musify/configs/app_typography.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomButton({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimensions.normalize(20),
      child: MaterialButton(
        shape: const StadiumBorder(),
        onPressed: onPressed,
        color: AppTheme.c!.primary,
        child: WidgetAnimator(
          child: Text(
            title,
            style: AppText.b1,
          ),
        ),
      ),
    );
  }
}
