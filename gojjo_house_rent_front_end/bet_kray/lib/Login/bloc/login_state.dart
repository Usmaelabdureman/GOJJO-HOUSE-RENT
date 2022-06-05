part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}
class LoginInitialState extends LoginState{}

class LoginLoadingState extends LoginState{}

class UserLoginSuccessState extends LoginState{}

class AdminLoginSuccesState extends LoginState{}

class LoginErrorState extends LoginState{
  final String message;
  LoginErrorState(this.message);
}
class logoutState extends LoginState{}


