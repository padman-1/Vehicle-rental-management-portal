// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'general_info_cubit.dart';

// sealed class SpecsInfoState extends Equatable {

//   const GeneralInfoState();

//   @override
//   List<Object> get props => [];
// }

class SpecsInfoState extends Equatable {
  final String brandController;
  final String vehicleNumberController;
  final String insuranceNumberController;
  final String vinNumberController;
  final String amountController;
  final String carSpeedController;
  final String engineTypeController;
  final String horsePowerController;
  final String engineCapacityController;
  final String fuelLevelController;
  final String tankCapacityController;
  final String milleageController;
  final XFile? imageFile;
  final SpecsFormState specsFormState;
  const SpecsInfoState({
    required this.brandController,
    required this.vehicleNumberController,
    required this.insuranceNumberController,
    required this.vinNumberController,
    required this.amountController,
    required this.carSpeedController,
    required this.engineTypeController,
    required this.horsePowerController,
    required this.engineCapacityController,
    required this.fuelLevelController,
    required this.tankCapacityController,
    required this.milleageController,
    required this.imageFile,
    required this.specsFormState,
  });

  SpecsInfoState copyWith({
    String? brandController,
    String? vehicleNumberController,
    String? insuranceNumberController,
    String? vinNumberController,
    String? amountController,
    String? carSpeedController,
    String? engineTypeController,
    String? horsePowerController,
    String? engineCapacityController,
    String? fuelLevelController,
    String? tankCapacityController,
    String? milleageController,
    XFile? imageFile,
    SpecsFormState? specsFormState,
  }) {
    return SpecsInfoState(
      brandController: brandController ?? this.brandController,
      vehicleNumberController:
          vehicleNumberController ?? this.vehicleNumberController,
      insuranceNumberController:
          insuranceNumberController ?? this.insuranceNumberController,
      vinNumberController: vinNumberController ?? this.vinNumberController,
      amountController: amountController ?? this.amountController,
      carSpeedController: carSpeedController ?? this.carSpeedController,
      engineTypeController: engineTypeController ?? this.engineTypeController,
      horsePowerController: horsePowerController ?? this.horsePowerController,
      engineCapacityController:
          engineCapacityController ?? this.engineCapacityController,
      fuelLevelController: fuelLevelController ?? this.fuelLevelController,
      tankCapacityController:
          tankCapacityController ?? this.tankCapacityController,
      milleageController: milleageController ?? this.milleageController,
      imageFile: imageFile ?? this.imageFile,
      specsFormState: specsFormState ?? this.specsFormState,
    );
  }

  @override
  bool get stringify => true;

  @override
  List get props {
    return [
      brandController,
      vehicleNumberController,
      insuranceNumberController,
      vinNumberController,
      amountController,
      carSpeedController,
      engineTypeController,
      horsePowerController,
      engineCapacityController,
      fuelLevelController,
      tankCapacityController,
      milleageController,
      imageFile,
      specsFormState
    ];
  }
}

enum SpecsFormState { initial, loading, success, failed }
