import 'package:bloc/bloc.dart';
import 'package:local_auth/local_auth.dart';
import '../controller/home_controller.dart';
import '../model/orders_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeController homeController = HomeController();
  final LocalAuthentication auth = LocalAuthentication();

  HomeBloc() : super(HomeInitial()) {
    on<FetchOrders>(
      (event, emit) async {
        emit(HomeLoading());

        try {
          Map<String, dynamic> data = await homeController.fetchOrders();
          GetBranchOrdersApiResModel getBranchOrdersApiResModel =
              GetBranchOrdersApiResModel.fromJson(data);
          if (data['status']) {
            emit(
              OrdersLoadedSuccessfully(
                orders: getBranchOrdersApiResModel.orders,
                permission: getBranchOrdersApiResModel.permission!,
              ),
            );
          } else {
            emit(
              OrderAddedFailure(),
            );
          }
        } catch (e) {
          emit(
            HomeError(
              message: e.toString(),
            ),
          );
        }
      },
    );
  }
}
