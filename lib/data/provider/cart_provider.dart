import 'package:flutter/foundation.dart';
import '../model/menu_item.dart';

class CartItem {
  final MenuItem menuItem;
  int quantity;

  CartItem({required this.menuItem, required this.quantity});
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice => _items.fold(0, (total, item) => total + item.menuItem.price * item.quantity);

  void addItem(MenuItem menuItem, int quantity) {
    for (CartItem item in _items) {
      if (item.menuItem.id == menuItem.id) {
        item.quantity += quantity;
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(menuItem: menuItem, quantity: quantity));
    notifyListeners();
  }

  void removeItem(String menuItemId) {
    _items.removeWhere((item) => item.menuItem.id == menuItemId);
    notifyListeners();
  }

  void updateItemQuantity(String menuItemId, int quantity) {
    for (CartItem item in _items) {
      if (item.menuItem.id == menuItemId) {
        item.quantity = quantity;
        notifyListeners();
        return;
      }
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}