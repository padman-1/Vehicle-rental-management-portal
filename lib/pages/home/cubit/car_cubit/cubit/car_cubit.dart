import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:vehicle_rental_management_portal/data/models/car.dart';
import 'package:vehicle_rental_management_portal/data/repositories/car_repository.dart';

part 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit({required CarRepository carRepository})
      : _carRepository = carRepository,
        super(CarInitial()) {
    emit(CarLoading());
    _subscription = carRepository.getCar().listen((event) {});
  }

  final CarRepository _carRepository;
  late StreamSubscription<QuerySnapshot>? _subscription;
}
