import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();
}
