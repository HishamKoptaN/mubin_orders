import 'package:bloc/bloc.dart';
import '../provider/add_order.controller.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<ProductEvent, OrderState> {
  AddOrderController addOrderController = AddOrderController();

  OrderBloc() : super(OrderInitial()) {
    on<AddOrderEvent>(
      (event, emit) async {
        emit(OrderLoading());
        try {
          Map<String, dynamic> data = await addOrderController.addOrder(
            event.clientId,
            event.place,
            event.video,
            event.imageOne,
            event.imageTwo,
          );
          if (data['status']) {
            emit(
              OrdersAddedSuccessfully(),
            );
          } else if (!data['status']) {
            emit(
              OrderAddedFailure(),
            );
          }
        } catch (e) {
          emit(
            OrderTimeout(),
          );
        }
      },
    );
  }
}
