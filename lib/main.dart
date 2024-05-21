import 'package:flutter/material.dart';
import 'package:food_for_you/presentation/screens/splash_screen.dart';
import 'package:food_for_you/presentation/utils/strings.dart';
import 'package:food_for_you/presentation/utils/theme.dart';
import 'package:provider/provider.dart';
import 'data/provider/cart_provider.dart';
import 'di/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
          create: (_) => locator<CartProvider>(),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.titleApp,
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}