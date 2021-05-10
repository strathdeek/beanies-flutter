import 'package:beanies/views/screens/new_game_view.dart';
import 'package:beanies/views/screens/player_list_view.dart';
import 'package:flutter/material.dart';

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
                SizedBox(
                  height: 25,
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text('show all in progress'))
                          ],
                        )
                      ],
                    ),
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
