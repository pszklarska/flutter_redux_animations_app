import 'package:flutter/material.dart';

const CART_BAR_HEIGHT = 48.0;

class CartValueBar extends StatelessWidget {
  final double cartValue;

  const CartValueBar({Key key, this.cartValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cartValue != 0
        ? Container(
            height: CART_BAR_HEIGHT,
            color: Colors.orange,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Cart value ${_getCartValue()} zł',
                  ),
                ),
              ],
            ),
          )
        : Container();
  }

  String _getCartValue() => cartValue.toStringAsFixed(2);
}
