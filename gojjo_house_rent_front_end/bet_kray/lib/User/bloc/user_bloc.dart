import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';
import '../repository/user_repository.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserListLoading()) {
    on<LoadUser>((event, emit) async {
      emit(UserListLoading());
      try {
        final posts = await userRepository.fetchAllUser();
        emit(OperationSuccess(posts));
      } catch (error) {
        emit(OperationFailed(error));
      }
    });

    on<CreateUser>((event, emit) async {
      try {
        emit(RegistrationProcessing());
        final newUser = await userRepository.createUser(event.user);
        emit(SignUpSuccessFullyCompleted(newUser));
      } catch (error) {
        emit(SignUpFailed(error));
      }
    });

    on<UpdateUser>((event, emit) async {
      try {
        await userRepository.updateUserData(event.id, event.user);
        final posts = await userRepository.fetchAllUser();
        emit(OperationSuccess(posts));
      } catch (error) {
        emit(OperationFailed(error));
      }
    });

    on<DeleteUser>((event, emit) async {
      try {
        await userRepository.delete(event.id);
        final courses = await userRepository.fetchAllUser();
        emit(OperationSuccess(courses));
      } catch (error) {
        emit(OperationFailed(error));
      }
    });
  }
}