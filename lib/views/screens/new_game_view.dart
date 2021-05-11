import 'package:beanies/data/blocs/game/game_cubit.dart';
import 'package:beanies/data/blocs/user/user_cubit.dart';
import 'package:beanies/data/models/user.dart';
import 'package:beanies/views/screens/game_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewGameScreen extends StatefulWidget {
  @override
  _NewGameScreenState createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  final List<User> _players = <User>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SELECT PLAYERS'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Players',
                      style: Theme.of(context).textTheme.headline5,
                    )),
                SizedBox(
                  height: 25,
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: BlocBuilder<UserCubit, UserState>(
                        builder: (context, state) {
                          return (state is UserLoadSuccess &&
                                  state.users.isNotEmpty)
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var user = state.users[index];
                                    return CheckboxListTile(
                                      title: Text(user.name),
                                      value: _players.contains(user),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value!) {
                                            _players.add(user);
                                          } else {
                                            _players.remove(user);
                                          }
                                        });
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      Divider(),
                                  itemCount: state.users.length)
                              : Text('nothin');
                        },
                      )),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  var game = context.read<GameCubit>().createGame(_players);
                  if (game != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GameScreen(game: game)));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start',
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
