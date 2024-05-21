import 'package:flutter/material.dart';
import 'package:food_for_you/presentation/utils/strings.dart';
import '../widgets/custom_anim_widgets.dart';
import '../widgets/custom_image_widgets.dart';
import 'menu_list_screen.dart';

class OrderSuccessScreen extends StatelessWidget {
  final String name;

  const OrderSuccessScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.orderSuccess)),
      body: Stack(
        children: [
          const BackgroundImage(opacity: 0.85),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                    child: CustomLottieAnimation(
                      assetPath: 'assets/jsons/pizza_small.json',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppStrings.thankYou,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '$name!',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${AppStrings.orderNumber}#${DateTime.now().year + DateTime.now().millisecond}',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppStrings.enjoyMeal,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text(AppStrings.backToMenu),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MenuListScreen()),
                            (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}