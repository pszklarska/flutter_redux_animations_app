import 'package:flutter/material.dart';

const CART_BAR_HEIGHT = 48.0;

class CartValueBar extends StatelessWidget {
  final double cartValue;

  const CartValueBar({Key key, this.cartValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: CART_BAR_HEIGHT,
      duration: Duration(milliseconds: 300),
      transform: Matrix4.translationValues(
          0, cartValue != 0 ? 0 : CART_BAR_HEIGHT, 0),
      color: Colors.orange,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0),
            child: Text(
              cartValue != 0
                  ? 'Cart value ${_getCartValue()} zł'
                  : '',
            ),
          ),
        ],
      ),
    );
  }

  String _getCartValue() => cartValue.toStringAsFixed(2);
}
