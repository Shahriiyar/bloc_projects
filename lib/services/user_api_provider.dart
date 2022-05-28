import 'package:provider_exemple/models/user.dart';
import 'package:provider_exemple/services/user_repository.dart';

class UserRepository {
  UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
