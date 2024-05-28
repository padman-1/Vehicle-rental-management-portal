import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'general_info_state.dart';

class GeneralInfoCubit extends Cubit<GeneralInfoState> {
  GeneralInfoCubit()
      : super(const GeneralInfoState(
          amountController: '',
          brandController: '',
          vehicleNumberController: '',
          insuranceNumberController: '',
          vinNumberController: '',
        ));

  void updateText(String fieldName, String newText) {
    final newState = state.copyWith(
      {
        'brandcontroller': state.brandController,
        'amountController': state.amountController,
        'vehicleNumberController': state.vehicleNumberController,
        'insuranceNumberController': state.insuranceNumberController,
        'vinNumberController': state.vinNumberController,
      }[fieldName] = newText,
    );
    emit(newState);
  }
}
