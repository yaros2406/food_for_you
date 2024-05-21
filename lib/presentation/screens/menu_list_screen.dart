import 'package:flutter/material.dart';
import 'package:food_for_you/presentation/utils/strings.dart';
import 'package:provider/provider.dart';
import '../../data/model/menu_item.dart';
import '../../data/provider/cart_provider.dart';
import '../../data/repository/menu_repository.dart';
import '../../di/locator.dart';
import '../widgets/custom_image_widgets.dart';
import 'add_to_cart_screen.dart';

class MenuListScreen extends StatefulWidget {
  const MenuListScreen({super.key});

  @override
  MenuListScreenState createState() => MenuListScreenState();
}

class MenuListScreenState extends State<MenuListScreen> {
  late Future<List<MenuItem>> futureMenuItems;

  @override
  void initState() {
    super.initState();
    futureMenuItems = locator<MenuRepository>().fetchMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.menu)),
      body: Stack(
        children: [
          const BackgroundImage(opacity: 0.85),
          FutureBuilder<List<MenuItem>>(
            future: futureMenuItems,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('${AppStrings.errorMenu}: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text(AppStrings.noItems));
              }

              final menuItems = snapshot.data!;
              return ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Card(
                    color: Colors.transparent,
                    elevation:0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            item.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          trailing: Text(
                              '\$${item.price}',
                              style: Theme.of(context).textTheme.bodyLarge
                          ),
                          subtitle: Text(
                            item.description,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddToCartScreen(menuItem: item)),
                            );
                          },
                        ),
                        ImageCarousel(imageUrls: item.imageUrls, itemName: item.name),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: Consumer<CartProvider>(
              builder: (context, cart, child) {
                int totalItems = cart.items.fold(0, (sum, item) => sum + item.quantity);
                return CartButton(totalItems: totalItems);
              },
            ),
          ),
        ],
      ),
    );
  }
}