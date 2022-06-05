part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends LoginEvent{
  AppStarted();
} 

class logoutButtonPressed extends LoginEvent{
}
class loginButtonPressed extends LoginEvent{

  final String email;
  final String password;
  
  loginButtonPressed(this.email,this.password);

  @override
  List<Object> get props => [email, password];

    @override
  String toString() => 'User data Updated {user Id: ${email}}';

}


