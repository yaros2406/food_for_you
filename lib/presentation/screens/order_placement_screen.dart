import 'package:flutter/material.dart';
import 'package:food_for_you/presentation/utils/strings.dart';
import 'package:provider/provider.dart';
import '../../data/provider/cart_provider.dart';
import '../widgets/custom_anim_widgets.dart';
import '../widgets/custom_dialog_widget.dart';
import '../widgets/custom_image_widgets.dart';

class OrderPlacementScreen extends StatefulWidget {
  const OrderPlacementScreen({super.key});

  @override
  OrderPlacementScreenState createState() => OrderPlacementScreenState();
}

class OrderPlacementScreenState extends State<OrderPlacementScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isButtonEnabled = false;

  void _checkIfButtonShouldBeEnabled() {
    setState(() {
      _isButtonEnabled = _nameController.text.isNotEmpty;
    });
  }

  void _showConfirmationPopup(BuildContext context, String userName) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmationPopup(userName: userName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.placeOrder)),
      body: Stack(
        children: [
          const BackgroundImage(opacity: 0.85),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: TextField(
                      controller: _nameController,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        labelText: AppStrings.enterName,
                        labelStyle: Theme.of(context).textTheme.titleMedium,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 238, 154, 073)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      onChanged: (text) => _checkIfButtonShouldBeEnabled(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _isButtonEnabled
                        ? () {
                      Provider.of<CartProvider>(context, listen: false).clearCart();
                      _showConfirmationPopup(context, _nameController.text);
                    }
                        : null,
                    child: const Text(AppStrings.placeOrder),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(
                    height: 200,
                    width: 400,
                    child: CustomLottieAnimation(
                      assetPath: 'assets/jsons/rolling_food.json',
                      fit: BoxFit.fill,
                    ),
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