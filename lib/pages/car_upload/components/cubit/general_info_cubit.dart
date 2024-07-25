import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'general_info_state.dart';

class SpecsInfoCubit extends Cubit<SpecsInfoState> {
  SpecsInfoCubit()
      : super(const SpecsInfoState(
          amountController: '',
          brandController: '',
          vehicleNumberController: '',
          insuranceNumberController: '',
          vinNumberController: '',
          carSpeedController: '',
          engineTypeController: '',
          horsePowerController: '',
          engineCapacityController: '',
          fuelLevelController: '',
          tankCapacityController: '',
          milleageController: '',
          imageFile: null,
        ));

  void onAmountChanged(String amountController) {
    emit(state.copyWith(amountController: amountController));
  }

  void onBrandChanged(String brandController) {
    emit(state.copyWith(brandController: brandController));
  }

  void onVehicleNNumberChanged(String vehicleNumberController) {
    emit(state.copyWith(vehicleNumberController: vehicleNumberController));
  }

  void onInsuranceNumberChanged(String insuranceNumberController) {
    emit(state.copyWith(insuranceNumberController: insuranceNumberController));
  }

  void onVinNumberChanged(String vinNumberController) {
    emit(state.copyWith(vinNumberController: vinNumberController));
  }

  void onCarSpeedChanged(String carSpeedController) {
    emit(state.copyWith(carSpeedController: carSpeedController));
  }

  void onEngineTypeChanged(String engineTypeController) {
    emit(state.copyWith(engineTypeController: engineTypeController));
  }

  void onHorsePowerChanged(String horsePowerController) {
    emit(state.copyWith(horsePowerController: horsePowerController));
  }

  void onEngineCapacityChanged(String engineCapacityController) {
    emit(state.copyWith(engineCapacityController: engineCapacityController));
  }

  void onFuelLevelChanged(String fuelLevelController) {
    emit(state.copyWith(fuelLevelController: fuelLevelController));
  }

  void onTankCapacityChanged(String tankCapacityController) {
    emit(state.copyWith(tankCapacityController: tankCapacityController));
  }

  void onMilleageChanged(String milleageController) {
    emit(state.copyWith(milleageController: milleageController));
  }

  void onImageSelected(File file) {
    emit(state.copyWith(imageFile: file));
  }

  // void updateText(String fieldName, String newText) {
  //   final newState = state.copyWith(
  //     {
  //       'brandcontroller': state.brandController,
  //       'amountController': state.amountController,
  //       'vehicleNumberController': state.vehicleNumberController,
  //       'insuranceNumberController': state.insuranceNumberController,
  //       'vinNumberController': state.vinNumberController,
  //     }[fieldName] = newText,
  //   );
  //   emit(newState);
  // }
}
