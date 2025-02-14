import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../add_order/views/add_order_view.dart';
import '../../orders/present/views/orders_view.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          HomeState(
            title: 'Home',
            currentIndex: 0,
            pages: [
              OrdersView(),
              const AddOrderView(),
            ],
          ),
        );

  void setCurrentIndex(int index, BuildContext context) {
    switch (index) {
      case 0:
        emit(state.copyWith(
          title: "S.of(context)!.home_title",
          currentIndex: index,
        ));
        break;
      case 1:
        emit(state.copyWith(
          title: "S.of(context)!.add_order",
          currentIndex: index,
        ));
        break;
    }
  }
}
