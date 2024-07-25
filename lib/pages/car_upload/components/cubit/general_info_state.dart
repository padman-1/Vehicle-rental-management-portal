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
  final dynamic imageFile;
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
    dynamic imageFile,
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
    );
  }

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
    ];
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'brandController': brandController,
  //     'vehicleNumberController': vehicleNumberController,
  //     'insuranceNumberController': insuranceNumberController,
  //     'vinNumberController': vinNumberController,
  //     'amountController': amountController,
  //     'carSpeedController': carSpeedController,
  //     'engineTypeController': engineTypeController,
  //     'horsePowerController': horsePowerController,
  //     'engineCapacityController': engineCapacityController,
  //     'fuelLevelController': fuelLevelController,
  //     'tankCapacityController': tankCapacityController,
  //     'milleageController': milleageController,
  //   };
  // }

  // factory SpecsInfoState.fromMap(Map<String, dynamic> map) {
  //   return SpecsInfoState(
  //     brandController: map['brandController'] as String,
  //     vehicleNumberController: map['vehicleNumberController'] as String,
  //     insuranceNumberController: map['insuranceNumberController'] as String,
  //     vinNumberController: map['vinNumberController'] as String,
  //     amountController: map['amountController'] as String,
  //     carSpeedController: map['carSpeedController'] as String,
  //     engineTypeController: map['engineTypeController'] as String,
  //     horsePowerController: map['horsePowerController'] as String,
  //     engineCapacityController: map['engineCapacityController'] as String,
  //     fuelLevelController: map['fuelLevelController'] as String,
  //     tankCapacityController: map['tankCapacityController'] as String,
  //     milleageController: map['milleageController'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory SpecsInfoState.fromJson(String source) => SpecsInfoState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'brandController': brandController,
  //     'vehicleNumberController': vehicleNumberController,
  //     'insuranceNumberController': insuranceNumberController,
  //     'vinNumberController': vinNumberController,
  //     'amountController': amountController,
  //     'carSpeedController': carSpeedController,
  //     'engineTypeController': engineTypeController,
  //     'horsePowerController': horsePowerController,
  //     'engineCapacityController': engineCapacityController,
  //     'fuelLevelController': fuelLevelController,
  //     'tankCapacityController': tankCapacityController,
  //     'milleageController': milleageController,
  //     'imageFile': imageFile?.toMap(),
  //   };
  // }

  // factory SpecsInfoState.fromMap(Map<String, dynamic> map) {
  //   return SpecsInfoState(
  //     brandController: map['brandController'] as String,
  //     vehicleNumberController: map['vehicleNumberController'] as String,
  //     insuranceNumberController: map['insuranceNumberController'] as String,
  //     vinNumberController: map['vinNumberController'] as String,
  //     amountController: map['amountController'] as String,
  //     carSpeedController: map['carSpeedController'] as String,
  //     engineTypeController: map['engineTypeController'] as String,
  //     horsePowerController: map['horsePowerController'] as String,
  //     engineCapacityController: map['engineCapacityController'] as String,
  //     fuelLevelController: map['fuelLevelController'] as String,
  //     tankCapacityController: map['tankCapacityController'] as String,
  //     milleageController: map['milleageController'] as String,
  //     imageFile: map['imageFile'] != null ? File.fromMap(map['imageFile'] as Map<String,dynamic>) : null,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory SpecsInfoState.fromJson(String source) => SpecsInfoState.fromMap(json.decode(source) as Map<String, dynamic>);
}
