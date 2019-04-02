import 'package:flutter/material.dart';
import 'package:flutter_redux_animations/model/cart_item.dart';

class ShoppingListItem extends StatelessWidget {
  final CartItem item;
  final Function(CartItem) onProductAdded;
  final Function(CartItem) onProductRemoved;

  ShoppingListItem({this.item, this.onProductAdded, this.onProductRemoved});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.store),
      title: Text(item.name),
      subtitle: Text('Price: ${item.price} zł'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () => onProductRemoved(item),
          ),
          Text(item.quantity.toString()),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => onProductAdded(item),
          ),
        ],
      ),
    );
  }
}
