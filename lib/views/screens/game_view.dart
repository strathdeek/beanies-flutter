import 'package:beanies/data/blocs/game/game_cubit.dart';
import 'package:beanies/data/blocs/user/user_cubit.dart';
import 'package:beanies/data/models/game.dart';
import 'package:beanies/views/widgets/score_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beanies/data/utils/extensions.dart';

class GameScreen extends StatefulWidget {
  final Game game;

  const GameScreen({Key? key, required this.game}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late String _gameId;
  late Map<String, TextEditingController> _scoreInputControllers;
  @override
  void initState() {
    super.initState();
    _gameId = widget.game.id;
    _scoreInputControllers = Map.fromEntries(widget.game.users
        .map<MapEntry<String, TextEditingController>>(
            (e) => MapEntry(e, TextEditingController())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BEANIES'),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () =>
                Navigator.of(context).popUntil((route) => route.isFirst)),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Scores',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            BlocBuilder<GameCubit, GameState>(
              builder: (context, state) {
                var currentGame = (state as GameLoadSuccess)
                    .games
                    .firstWhere((element) => element.id == _gameId);
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScoreChart(currentGame),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              currentGame.isDone
                                  ? '${context.read<UserCubit>().getUserName(currentGame.winner)} won!'
                                  : '${currentGame.currentRound.toCardName()}',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          currentGame.isDone
                              ? Container()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: currentGame.users
                                      .map<Widget>((user) => Column(
                                            children: [
                                              Text(context
                                                  .read<UserCubit>()
                                                  .getUserName(user)),
                                              Container(
                                                  height: 50,
                                                  width: 50,
                                                  child: TextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    controller:
                                                        _scoreInputControllers[
                                                            user],
                                                  ))
                                            ],
                                          ))
                                      .toList()
                                        ..add(FloatingActionButton(
                                          onPressed: () {
                                            if (_scoreInputControllers.values
                                                .any((element) =>
                                                    element.text.isEmpty)) {
                                              return;
                                            }
                                            var scores = Map.fromEntries(
                                                widget.game.users.map<
                                                    MapEntry<String,
                                                        int>>((e) => MapEntry(
                                                    e,
                                                    int.parse(
                                                        _scoreInputControllers[
                                                                    e]
                                                                ?.text ??
                                                            '0'))));
                                            context
                                                .read<GameCubit>()
                                                .addScores(_gameId, scores);
                                            _scoreInputControllers
                                                .forEach((key, value) {
                                              value.clear();
                                            });
                                          },
                                          child: Icon(Icons.add),
                                        )),
                                ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
