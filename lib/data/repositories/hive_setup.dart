import 'package:beanies/data/constants/hive.dart';
import 'package:beanies/data/models/user.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());

  Hive.openBox<User>(HiveUserBoxKey);
}
