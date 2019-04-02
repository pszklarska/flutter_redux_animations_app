import 'package:flutter_redux_animations/model/app_state.dart';
import 'package:flutter_redux_animations/model/cart_item.dart';
import 'package:flutter_redux_animations/redux/actions.dart';
import 'package:redux/redux.dart';

class ShoppingListViewModel {
  final List<CartItem> cartItems;
  final Function(CartItem) onProductAdded;
  final Function(CartItem) onProductRemoved;

  ShoppingListViewModel({this.cartItems, this.onProductAdded, this.onProductRemoved});

  static build(Store<AppState> store) => ShoppingListViewModel(
        cartItems: store.state.cartItems,
        onProductAdded: (cartItem) => store.dispatch(AddItemAction(cartItem)),
        onProductRemoved: (cartItem) => store.dispatch(RemoveItemAction(cartItem)),
      );
}
