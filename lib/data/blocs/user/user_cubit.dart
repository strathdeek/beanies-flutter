import 'package:beanies/data/models/user.dart';
import 'package:beanies/data/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  UserCubit(this._userRepository) : super(UserLoadInProgress());

  void loadUsers() {
    try {
      var users = _userRepository.get();
      emit(UserLoadSuccess(users));
    } catch (e) {
      emit(UserLoadFail(e.toString()));
    }
  }

  void addUser(String name) {
    try {
      var newUser = User(id: Uuid().v4(), name: name);
      _userRepository.add(newUser);
      var updatedUsers = _userRepository.get();
      emit(UserLoadSuccess(updatedUsers));
    } catch (e) {
      emit(UserLoadFail(e.toString()));
    }
  }

  void deleteUser(User user) {
    try {
      _userRepository.delete(user);
      var updatedUsers = _userRepository.get();
      emit(UserLoadSuccess(updatedUsers));
    } catch (e) {
      emit(UserLoadFail(e.toString()));
    }
  }

  void updateUser(User user) {
    try {
      _userRepository.update(user);
      var updatedUsers = _userRepository.get();
      emit(UserLoadSuccess(updatedUsers));
    } catch (e) {
      emit(UserLoadFail(e.toString()));
    }
  }

  String getUserName(String id) {
    return _userRepository.get().firstWhere((element) => element.id == id).name;
  }
}
