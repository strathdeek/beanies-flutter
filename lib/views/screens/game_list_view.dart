import 'package:beanies/data/blocs/game/game_cubit.dart';
import 'package:beanies/views/screens/new_game_view.dart';
import 'package:beanies/views/widgets/game_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameListScreen extends StatelessWidget {
  const GameListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BEANIES'),
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
                      'Games in progress',
                      style: Theme.of(context).textTheme.headline5,
                    )),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      BlocBuilder<GameCubit, GameState>(
                        builder: (context, state) {
                          if (state is GameLoadSuccess &&
                              state.games.isNotEmpty &&
                              state.games.any((element) => !element.isDone)) {
                            var unfinishedGames = state.games
                                .where((element) => !element.isDone)
                                .toList();
                            unfinishedGames
                                .sort((a, b) => a.date.compareTo(b.date));

                            return ListView(
                              shrinkWrap: true,
                              children: unfinishedGames
                                  .map((e) => GameSummary(e))
                                  .toList(),
                            );
                          } else {
                            return Text(
                              'No games in progress...',
                              style: Theme.of(context).textTheme.caption,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
