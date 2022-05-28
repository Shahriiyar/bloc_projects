import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_exemple/bloc/user_state.dart';
import 'package:provider_exemple/models/user.dart';
import 'package:provider_exemple/services/user_api_provider.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit(this.userRepository) : super(UserEmptyState());

  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());
      final List<User> _loadedUserList = await userRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: _loadedUserList));
    } catch (_) {
      emit(UserErrorState());
    }
  }

  Future<void> clearUsers() async {
    emit(UserEmptyState());
  }
}
