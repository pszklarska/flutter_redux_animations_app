import 'package:flutter_redux_animations/model/cart_item.dart';

class AddItemAction {
  final CartItem item;

  AddItemAction(this.item);
}

class RemoveItemAction {
  final CartItem item;

  RemoveItemAction(this.item);
}
