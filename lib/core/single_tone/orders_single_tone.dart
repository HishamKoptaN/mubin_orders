import 'package:mubin_orders/features/orders/data/models/orders_res_model.dart';

class OrdersSingletone {
  OrdersResModel? _ordersResModel;
  static final OrdersSingletone _instance = OrdersSingletone._internal();
  OrdersSingletone._internal();
  static OrdersSingletone get instance => _instance;
  OrdersResModel? get ordersResModel => _ordersResModel;
  set ordersResModel(OrdersResModel? ordersResModel) {
    _ordersResModel = ordersResModel;
  }

  void clearOrdersResModel() {
    _ordersResModel = null;
  }
}
