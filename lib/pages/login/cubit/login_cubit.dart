import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vehicle_rental_management_portal/data/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginInitial());

  final AuthRepository _authRepository;

  void onEmailChanged(String email) {
    emit(LoginFormChanged(model: state.model.copyWith(email: email)));
  }

  void onPasswordChanged(String password) {
    emit(LoginFormChanged(model: state.model.copyWith(password: password)));
  }

  Future<void> onSubmit() async {
    emit(LoginLoadingState(model: state.model.copyWith()));
    final response = await _authRepository.login(
        email: state.model.email, password: state.model.password);

    if (response is String) {
      emit(LoginErrorState(response, model: state.model));
      return;
    }
    emit(LoginSuccessState(model: state.model));
  }
}
