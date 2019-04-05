import 'package:flutter_redux_animations/model/cart_item.dart';

class AppState {
  static var empty = AppState([
    CartItem(1, 'Jackfruit', 0, 0.79),
    CartItem(2, 'Coconut', 0, 2.29),
    CartItem(3, 'Pineapple', 0, 1.39),
    CartItem(4, 'Mango', 0, 2.19),
  ]);

  final List<CartItem> cartItems;

  AppState(this.cartItems);
}
