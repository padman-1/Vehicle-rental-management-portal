part of 'car_cubit.dart';

sealed class CarState extends Equatable {
  const CarState();

  @override
  List<Object> get props => [];
}

final class CarInitial extends CarState {}

final class CarLoading extends CarState {}

final class CarSuccess extends CarState {
  const CarSuccess({required this.cars});

  final List<Car> cars;

  @override
  List<Object> get props => [cars];
}

final class CarError extends CarState {
  const CarError({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
