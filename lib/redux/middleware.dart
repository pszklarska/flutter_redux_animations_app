import 'package:flutter_redux_animations/model/app_state.dart';
import 'package:redux/redux.dart';

const String APP_STATE_KEY = "APP_STATE";

void storeCartItemsMiddleware(Store<AppState> store, action, NextDispatcher next) {
  next(action);
}
