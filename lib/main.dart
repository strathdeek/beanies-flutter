import 'package:beanies/data/blocs/user/user_cubit.dart';
import 'package:beanies/data/repositories/game_repository.dart';
import 'package:beanies/data/repositories/hive_setup.dart';
import 'package:beanies/data/repositories/user_repository.dart';
import 'package:beanies/views/screens/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/blocs/game/game_cubit.dart';

void main() async {
  await initializeHive();

  var userRepository = UserRepository();
  var gameRepository = GameRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => UserCubit(userRepository)..loadUsers(),
      ),
      BlocProvider(
        create: (context) => GameCubit(gameRepository)..loadGames(),
      ),
    ],
    child: BeaniesApp(),
  ));
}

class BeaniesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}
