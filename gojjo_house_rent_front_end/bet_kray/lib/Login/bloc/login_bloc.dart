import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../UserRepository/user_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(LoginInitialState()) {
    on<AppStarted>((event, emit) async {
      emit(LoginInitialState());
    });
    on<loginButtonPressed>((event, emit) async {
      emit(LoginLoadingState());
      final pref = await SharedPreferences.getInstance();
      final data = await loginRepository.Login(event.email, event.password);
      if (data['type'] == 'admin') {
        pref.setString('refresh', data['refreshtoken']);
        pref.setString('access', data['accesstoken']);
        emit(AdminLoginSuccesState());
      } else if (data['type'] == 'user') {
        emit(UserLoginSuccessState());
      }
    });

    on<logoutButtonPressed>((event, emit) async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final refresh = await pref.getString("refresh");
      final access = await pref.getString("access");
      pref.remove(refresh!);
      pref.remove(access!);
      emit(LoginInitialState());
    });
  }
}
