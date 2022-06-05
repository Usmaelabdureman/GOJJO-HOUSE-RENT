import 'package:bet_kray/Request/models/request_model.dart';
import 'package:bet_kray/Request/repository/request_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final RequestRepository requestRepository;
  RequestBloc({required this.requestRepository}):super(RequestLoading()){
    on<UserRequestLoad>((event,emit) async {
      emit(RequestLoading());
      try{
        final requests = await requestRepository.fetchAllRequests();
        emit(UserRequestOperationSuccess(requests));
      }catch(error){
        emit(UserRequestOperationFailure(error));
      }
    });

    on<UserRequests>((event, emit) async{
      emit(RequestLoading());
      try{
        final requests = await requestRepository.fetchUserRequest();
        emit(UserRequestOperationSuccess(requests));
      }catch(error){
        emit(UserRequestOperationFailure(error));
      }
    });
    
    on<RequestCreate>((event, emit) async{
      try{
        await requestRepository.create(event.request);
        final requests = await requestRepository.fetchAllRequests();
        emit(UserRequestOperationSuccess(requests));
      }catch(error){
        emit(UserRequestOperationFailure(error));
      }
    });

      on<RequestUpdate>((event, emit) async{
      try{
        await requestRepository.update(event.id,event.request);
        final requests = await requestRepository.fetchAllRequests();
        emit(UserRequestOperationSuccess(requests));
      }catch(error){
        emit(UserRequestOperationFailure(error));
      }
    });

      on<RequestDelete>((event, emit) async{
      try{
        await requestRepository.delete(event.id);
        final requests = await requestRepository.fetchAllRequests();
        emit(UserRequestOperationSuccess(requests));
      }catch(error){
        emit(UserRequestOperationFailure(error));
      }
    });
  }
}
