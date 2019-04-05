import 'package:flutter_redux_animations/model/app_state.dart';
import 'package:flutter_redux_animations/model/cart_item.dart';
import 'package:flutter_redux_animations/redux/actions.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is AddItemAction) {
    return _addItem(state, action);
  } else if (action is RemoveItemAction) {
    return _removeItem(state, action);
  }
  return state;
}

AppState _addItem(AppState state, AddItemAction action) {
  return AppState(state.cartItems
      .map((item) => item.id == action.item.id ? getIncreasedQuantityItem(item) : item)
      .toList());
}

AppState _removeItem(AppState state, RemoveItemAction action) {
  return AppState(state.cartItems
      .map((item) => item.id == action.item.id ? getDecreasedQuantityItem(item) : item)
      .toList());
}

CartItem getIncreasedQuantityItem(CartItem item) {
  return item.copyWith(quantity: item.quantity + 1);
}

CartItem getDecreasedQuantityItem(CartItem item) {
  if (item.quantity <= 0) return item;
  return item.copyWith(quantity: item.quantity - 1);
}
