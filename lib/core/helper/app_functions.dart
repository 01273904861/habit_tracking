import 'package:flutter/material.dart';
import 'package:habbit_tracking_app/core/helper/extension.dart';
import 'package:intl/intl.dart';

class AppFunctions {
//esplay snacbar method
  static void showSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static Future<bool?> showAnimatedDialog(
    BuildContext context, {
    required String title,
    required String content,
    VoidCallback? onOkPressed,
    VoidCallback? onCancelpressed,
  }) {
    return showGeneralDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext diaologContext, anim1, anim2) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: onCancelpressed,
              child: const Text("No"),
            ),
            TextButton(
              onPressed: onOkPressed,
              child: const Text("Yes"),
            ),
          ],
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform.scale(
          scale: anim1.value,
          child: child,
        );
      },
    );
  }

  static String formateFullDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
    //yyyy-MM-dd HH:mm
  }

  static String formatDateNum(DateTime date) {
    return DateFormat('dd').format(date);
    //yyyy-MM-dd HH:mm
    // final String dayName = DateFormat('EEE').format(newDate);
  }

  static String formatDateName(DateTime date) {
    return DateFormat('EEE').format(date);
    //yyyy-MM-dd HH:mm
    // final String dayName = DateFormat('EEE').format(newDate);
  }

  static String getMotivationalMessage({double perc = 0}) {
    double percent = perc * 100;
    if (percent >= 80 && percent <= 100) {
      return "You're almost there! 🎯 just a little more to go. Keep pushing and finish strong! 💪🔥";
    } else if (percent >= 60 && percent < 80) {
      return "Great progress! 🚀 You're more than halfway done 🔥";
    } else if (percent >= 40 && percent < 60) {
      return "You're making steady progress! ⏳ You got this! 💪";
    } else if (percent >= 20 && percent < 40) {
      return "keep going step by step—progress is progress 🌱. Stay motivated! 🚀";
    } else {
      return "Every big achievement starts with small steps! 🌟 You can do this! 💪🔥";
    }
  }

  static Future<dynamic> customshowDialog(BuildContext context,
      void Function()? onOkPressed, void Function()? onCancelpressed) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Copy Habits'),
          content: const Text("Do you want to copy last day habits?"),
          actions: [
            TextButton(
              onPressed: onCancelpressed,
              child: const Text('No'),
            ),
            TextButton(onPressed: onOkPressed, child: const Text('Yes')),
          ],
        );
      },
    );
  }
}
