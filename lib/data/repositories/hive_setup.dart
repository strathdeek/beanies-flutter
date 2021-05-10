import 'package:beanies/data/constants/hive.dart';
import 'package:beanies/data/models/game.dart';
import 'package:beanies/data/models/user.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(GameAdapter());

  await Hive.openBox<User>(HiveUserBoxKey);
  await Hive.openBox<Game>(HiveGameBoxKey);
}
