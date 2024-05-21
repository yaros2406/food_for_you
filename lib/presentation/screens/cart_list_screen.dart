import 'package:flutter/material.dart';
import 'package:food_for_you/presentation/utils/strings.dart';
import 'package:provider/provider.dart';
import '../../data/provider/cart_provider.dart';
import '../../presentation/utils/show_toast.dart';
import '../widgets/custom_image_widgets.dart';
import 'order_placement_screen.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.cart)),
      body: Stack(
        children: [
          const BackgroundImage(opacity: 0.85),
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items[index];
                        return ListTile(
                          title: Text(item.menuItem.name, style: Theme.of(context).textTheme.titleMedium,),
                          subtitle: Text('${AppStrings.quantity}: ${item.quantity}', style: Theme.of(context).textTheme.bodySmall),
                          trailing: Text('\$${item.menuItem.price * item.quantity}', style: Theme.of(context).textTheme.bodyLarge),
                          leading: IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              if (item.quantity > 1) {
                                cart.updateItemQuantity(item.menuItem.id, item.quantity - 1);
                              } else {
                                cart.removeItem(item.menuItem.id);
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${AppStrings.total}: \$${cart.totalPrice}', style: Theme.of(context).textTheme.bodyLarge),
                        ElevatedButton(
                          child: const Text(AppStrings.placeOrder),
                          onPressed: () {
                            if (cart.items.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const OrderPlacementScreen()),
                              );
                            } else {
                              showToast(AppStrings.toast);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}