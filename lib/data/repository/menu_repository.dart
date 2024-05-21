import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/menu_item.dart';

class MenuRepository {
  Future<List<MenuItem>> fetchMenuItems() async {
    final response = await rootBundle.loadString('assets/jsons/menu.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => MenuItem.fromJson(json)).toList();
  }
}