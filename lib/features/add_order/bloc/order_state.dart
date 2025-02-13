abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final String message;
  OrderLoaded(this.message);
}

class OrderError extends OrderState {
  final String error;
  OrderError(this.error);
}

class OrdersAddedSuccessfully extends OrderState {}

class OrderAddedFailure extends OrderState {}

class OrderTimeout extends OrderState {}

class OrderProgress extends OrderState {
  final double progress;

  OrderProgress(this.progress);

  List<Object> get props => [progress];
}
