import '../data_providers/reqeust_data_provider.dart';
import '../models/request_model.dart';

class RequestRepository {
  final RequestDataProvider dataProvider;
  RequestRepository(this.dataProvider);

  Future<UserRequest> create(UserRequest request) async {
    return dataProvider.create(request);
  }

  Future<UserRequest> update(int id,UserRequest request) async{
    return dataProvider.update(id, request);
  }
  Future<List<UserRequest>> fetchAllRequests() async {
    return dataProvider.fetchAllRequests();
  }
  Future<List<UserRequest>>fetchUserRequest() async {
    return dataProvider.fetchUserRequest();
  }
  Future<void> delete(int id) async{
    dataProvider.delete(id);
  }
  
}