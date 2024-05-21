import 'package:flutter/material.dart';
import 'package:food_for_you/presentation/utils/strings.dart';
import 'package:provider/provider.dart';
import '../../data/model/menu_item.dart';
import '../../data/provider/cart_provider.dart';
import '../widgets/custom_image_widgets.dart';

class AddToCartScreen extends StatefulWidget {
  final MenuItem menuItem;

  const AddToCartScreen({super.key, required this.menuItem});

  @override
  AddToCartScreenState createState() => AddToCartScreenState();
}

class AddToCartScreenState extends State<AddToCartScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.addToCart)),
      body: Stack(
        children: [
          const BackgroundImage(opacity: 0.85),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.menuItem.name, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(widget.menuItem.description, style: Theme.of(context).textTheme.bodySmall,),
                const SizedBox(height: 8),
                Text('\$${widget.menuItem.price * quantity}', style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(AppStrings.quantity, style: Theme.of(context).textTheme.displayMedium),
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),
                    Text(quantity.toString(), style: Theme.of(context).textTheme.displayMedium),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const Text(AppStrings.addToCart),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false).addItem(widget.menuItem, quantity);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}