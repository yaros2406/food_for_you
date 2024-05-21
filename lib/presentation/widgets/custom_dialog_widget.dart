import 'package:flutter/material.dart';
import '../screens/order_success_screen.dart';
import '../utils/strings.dart';

class ConfirmationPopup extends StatelessWidget {
  final String userName;

  const ConfirmationPopup({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OrderSuccessScreen(name: userName)),
            (route) => false,
      );
    });

    return AlertDialog(
      title: Text(AppStrings.isSuccess,
        textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelLarge),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppStrings.success,
              style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}