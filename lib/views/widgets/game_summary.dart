import 'package:beanies/data/blocs/user/user_cubit.dart';
import 'package:beanies/data/models/game.dart';
import 'package:beanies/views/screens/game_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GameSummary extends StatelessWidget {
  final Game _game;
  const GameSummary(this._game, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => GameScreen(game: _game))),
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Game on ${DateFormat.MMMEd().format(_game.date)}',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(fontSize: 20),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Players',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Round',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _game.users
                        .map((e) => context.read<UserCubit>().getUserName(e))
                        .join(', '),
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${_game.currentRound}',
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
