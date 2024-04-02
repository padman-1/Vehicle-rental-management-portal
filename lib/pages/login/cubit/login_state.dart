part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState({required this.model});

  final LoginModel model;

  @override
  List<Object> get props => [model];
}

final class LoginInitial extends LoginState {
  const LoginInitial() : super(model: const LoginModel.intial());
}

final class LoginFormChanged extends LoginState {
  const LoginFormChanged({required super.model});
}

final class LoginLoadingState extends LoginState {
  const LoginLoadingState({required super.model});
}

final class LoginSuccessState extends LoginState {
  const LoginSuccessState({required super.model});
}

final class LoginErrorState extends LoginState {
  const LoginErrorState(this.error, {required super.model});
  final String error;

  @override
  List<Object> get props => [model, error];
}

class LoginModel extends Equatable {
  const LoginModel({required this.email, required this.password});
  const LoginModel.intial()
      : email = '',
        password = '';

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];

  LoginModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
