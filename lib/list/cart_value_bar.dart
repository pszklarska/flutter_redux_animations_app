import 'package:flutter/material.dart';

const CART_BAR_HEIGHT = 48.0;

class CartValueBar extends StatefulWidget {
  final double cartValue;

  const CartValueBar({Key key, this.cartValue})
      : super(key: key);

  @override
  _CartValueBarState createState() => _CartValueBarState();
}

class _CartValueBarState extends State<CartValueBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..addListener(() {
      setState(() {});
    });

    _animation = Tween<double>(
      begin: CART_BAR_HEIGHT,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, _animation.value),
      child: Container(
        height: CART_BAR_HEIGHT,
        color: Colors.orange,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0),
              child: Text(
                widget.cartValue != 0
                    ? 'Cart value ${_getCartValue()} zł'
                    : '',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CartValueBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.cartValue == 0) {
      _controller.forward();
    }

    if (widget.cartValue == 0) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  String _getCartValue() =>
      widget.cartValue.toStringAsFixed(2);
}
