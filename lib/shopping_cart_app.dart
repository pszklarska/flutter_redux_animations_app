import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_animations/list/shopping_list.dart';
import 'package:flutter_redux_animations/model/app_state.dart';
import 'package:flutter_redux_animations/redux/middleware.dart';
import 'package:flutter_redux_animations/redux/reducers.dart';
import 'package:redux/redux.dart';

class ShoppingCartApp extends StatelessWidget {
  final store = Store<AppState>(
    appStateReducers,
    initialState: AppState.empty,
    middleware: [
      storeCartItemsMiddleware,
    ],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'ShoppingList',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ShoppingCart(),
      ),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShoppingList'),
      ),
      body: ShoppingList(),
    );
  }
}
