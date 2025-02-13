import 'package:equatable/equatable.dart';

import '../model/orders_model.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List orders;

  HomeLoaded({required this.orders});

  @override
  List<Object> get props => [orders];
}

class OrdersLoadedSuccessfully extends HomeState {
  List<Order>? orders;
  String permission;
  OrdersLoadedSuccessfully({required this.orders, required this.permission});
}

class OrderAddedFailure extends HomeState {}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
