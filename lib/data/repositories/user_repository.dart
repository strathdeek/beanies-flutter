import 'package:beanies/data/constants/hive.dart';
import 'package:beanies/data/models/user.dart';
import 'package:hive/hive.dart';

class UserRepository {
  final Box<User> _userBox = Hive.box(HiveUserBoxKey);

  void add(User user) {
    _userBox.put(user.id, user);
  }

  void delete(User user) {
    _userBox.delete(user.id);
  }

  List<User> get() {
    return _userBox.values.toList();
  }

  void update(User user) {
    _userBox.put(user.id, user);
  }
}
