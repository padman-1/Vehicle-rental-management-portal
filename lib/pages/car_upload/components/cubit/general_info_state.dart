part of 'general_info_cubit.dart';

// sealed class GeneralInfoState extends Equatable {

//   const GeneralInfoState();

//   @override
//   List<Object> get props => [];
// }

class GeneralInfoState extends Equatable {
  const GeneralInfoState({
    required this.brandController,
    required this.vehicleNumberController,
    required this.insuranceNumberController,
    required this.vinNumberController,
    required this.amountController,
  });
  final String brandController;
  final String vehicleNumberController;
  final String insuranceNumberController;
  final String vinNumberController;
  final String amountController;

  GeneralInfoState copyWith(
    String s, {
    String? brandController,
    String? vehicleNumberController,
    String? insuranceNumberController,
    String? vinNumberController,
    String? amountController,
  }) {
    return GeneralInfoState(
      brandController: brandController ?? this.brandController,
      vehicleNumberController:
          vehicleNumberController ?? this.vehicleNumberController,
      insuranceNumberController:
          insuranceNumberController ?? this.insuranceNumberController,
      vinNumberController: vinNumberController ?? this.vinNumberController,
      amountController: amountController ?? this.amountController,
    );
  }

  @override
  List<Object> get props => [
        brandController,
        vehicleNumberController,
        insuranceNumberController,
        vinNumberController,
        amountController
      ];
}
