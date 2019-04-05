import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_animations/list/cart_value_bar.dart';
import 'package:flutter_redux_animations/list/shopping_list_item.dart';
import 'package:flutter_redux_animations/list/shopping_list_view_model.dart';
import 'package:flutter_redux_animations/model/app_state.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ShoppingListViewModel>(
      converter: (store) => ShoppingListViewModel.build(store),
      builder: (context, viewModel) {
        return Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: viewModel.cartItems.length,
              itemBuilder: (context, position) => ShoppingListItem(
                    item: viewModel.cartItems[position],
                    onProductAdded: viewModel.onProductAdded,
                    onProductRemoved: viewModel.onProductRemoved,
                  ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CartValueBar(cartValue: viewModel.cartValue),
            ),
          ],
        );
      },
    );
  }
}
