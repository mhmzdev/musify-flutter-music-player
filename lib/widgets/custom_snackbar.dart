import 'package:musify/configs/configs.dart';
import 'package:flutter/material.dart';

class CustomSnackBars {
  static failure(BuildContext context, String message, {Color? color}) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.info,
            color: Colors.white,
          ),
          Space.x!,
          Flexible(
            child: Text(
              message,
              style: AppText.b2!.cl(
                Colors.white,
              ),
            ),
          ),
        ],
      ),
    );

    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static success(BuildContext context, String message, {Color? color}) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: AppTheme.c!.primary!,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check,
            color: Colors.white,
          ),
          Space.x!,
          Flexible(
            child: Text(
              message,
              style: AppText.b2!.cl(
                Colors.white,
              ),
            ),
          ),
        ],
      ),
    );

    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
