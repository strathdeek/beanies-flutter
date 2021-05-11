import 'package:beanies/data/blocs/game/game_cubit.dart';
import 'package:beanies/views/screens/game_list_view.dart';
import 'package:beanies/views/screens/new_game_view.dart';
import 'package:beanies/views/screens/player_list_view.dart';
import 'package:beanies/views/widgets/game_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BEANIES'),
        actions: [
          IconButton(
              icon: Icon(Icons.supervised_user_circle_rounded),
              onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PlayerListScreen(),
                    ))
                  })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Game in progress',
                      style: Theme.of(context).textTheme.headline5,
                    )),
                Container(
                  padding: EdgeInsets.all(15),
                  child: BlocBuilder<GameCubit, GameState>(
                    builder: (context, state) {
                      if (state is GameLoadSuccess &&
                          state.games.isNotEmpty &&
                          state.games.any((element) => !element.isDone)) {
                        var unfinishedGames = state.games
                            .where((element) => !element.isDone)
                            .toList();
                        unfinishedGames
                            .sort((a, b) => a.date.compareTo(b.date));
                        return Column(
                          children: [
                            GameSummary(unfinishedGames.last),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GameListScreen()));
                                    },
                                    child: Text('show all in progress'))
                              ],
                            )
                          ],
                        );
                      } else {
                        return Text(
                          'No games in progress...',
                          style: Theme.of(context).textTheme.caption,
                        );
                      }
                    },
                  ),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewGameScreen(),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New Game',
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
