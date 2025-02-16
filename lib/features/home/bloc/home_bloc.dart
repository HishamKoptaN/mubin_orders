import 'package:flutter_bloc/flutter_bloc.dart';
import '../../orders/present/views/add_order_view.dart';
import '../../orders/present/views/orders_view.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(
          HomeState(
            title: 'Home',
            currentIndex: 0,
            pages: [
              OrdersView(),
              const AddOrderView(),
            ],
          ),
        ) {
    on<HomeEvent>((event, emit) {
      event.when(
        changeTab: (i,t) {
          emit(
            state.copyWith(
              title: i == 0 ? t.home_title:t.add_order,
              currentIndex: i,
            ),
          );
        },
      );
    },);
  }
}
