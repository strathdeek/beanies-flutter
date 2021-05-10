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
    );
  }
}
