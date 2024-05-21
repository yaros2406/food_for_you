import 'package:get_it/get_it.dart';
import '../data/provider/cart_provider.dart';
import '../data/repository/menu_repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => MenuRepository());
  locator.registerLazySingleton(() => CartProvider());
}