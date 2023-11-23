import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void showErrorToast(String message, {BuildContext? context}) {
  showToast(message,
      textStyle: const TextStyle(wordSpacing: 0.1, color: Colors.white),
      fullWidth: true,
      borderRadius: BorderRadius.circular(10),
      backgroundColor: Colors.red,
      alignment: Alignment.bottomLeft,
      textAlign: TextAlign.start,
      position: StyledToastPosition.top,
      animation: StyledToastAnimation.fade,
      duration: const Duration(seconds: 5),
      context: context);
}

void showSuccessToast(String message, {BuildContext? context}) {
  showToast(message,
      textStyle: const TextStyle(wordSpacing: 0.1),
      fullWidth: true,
      borderRadius: BorderRadius.circular(10),
      backgroundColor: Colors.green,
      alignment: Alignment.bottomLeft,
      textAlign: TextAlign.start,
      position: StyledToastPosition.top,
      animation: StyledToastAnimation.fade,
      duration: const Duration(seconds: 5),
      context: context);
}
