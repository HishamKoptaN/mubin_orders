import '../../features/orders/data/models/orders_res_model.dart';

class OrdersSingletone {
  // Singleton instance
  static final OrdersSingletone instance =
      OrdersSingletone._privateConstructor();

  // Private constructor to prevent direct instantiation
  OrdersSingletone._privateConstructor();

  // Variable to store the Orders response model
  OrdersResModel? ordersResModel;

  // Method to add new orders and update meta information
  void addOrders({
    required List<Order> newOrders,
    required Meta? newMeta,
  }) {
    if (ordersResModel == null) {
      ordersResModel = OrdersResModel(
        orders: newOrders,
        meta: newMeta,
      );
    } else {
      // Update orders list by adding new ones
      final updatedOrders = [...ordersResModel!.orders!, ...newOrders];

      // Merge the existing meta with the new one
      ordersResModel = ordersResModel!.copyWith(
        orders: updatedOrders,
        meta: newMeta,
      );
    }
  }

  void addSingleOrder({
    required Order newOrder,
  }) {
    if (ordersResModel == null) {
      ordersResModel = OrdersResModel(
        orders: [newOrder],
      );
    } else {
      // Add the single order to the existing list
      final updatedOrders = [...ordersResModel!.orders!, newOrder];

      // Merge the existing meta with the new one
      ordersResModel = ordersResModel!.copyWith(
        orders: updatedOrders,
      );
    }
  }
}
