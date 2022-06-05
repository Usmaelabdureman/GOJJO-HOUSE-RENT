import 'package:bet_kray/User/models/user.dart';
import '../data_provider/user_data_provider.dart';

class UserRepository {
  final UserDataProvider userDataProvider;
  UserRepository(this.userDataProvider);

  Future<User> createUser(User user) async {
    return userDataProvider.createUser(user);
  }

  Future<User> fetchUserDetails(int id) async {
    return userDataProvider.fetchUserDetails(id);
  }

  Future<User> updateUserData(int id, User user) async {
    return userDataProvider.updateUserData(id, user);
  }

  Future<List<User>> fetchAllUser() async {
    return userDataProvider.fetchAllUser();
  }

  Future<void> delete(int id) async {
    return userDataProvider.delete(id);
  }
}
