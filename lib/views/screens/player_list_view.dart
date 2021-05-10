import 'package:beanies/data/blocs/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PlayerListScreen extends StatelessWidget {
  void showUserCreationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        var _nameController = TextEditingController();
        return AlertDialog(
          title: Text('Name'),
          content: TextField(
            controller: _nameController,
            autofocus: true,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<UserCubit>().addUser(_nameController.text);
                  Navigator.of(context).pop();
                },
                child: Text('Submit'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PLAYERS'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Players',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return (state is UserLoadSuccess && state.users.isNotEmpty)
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var user = state.users[index];
                          return ListTile(
                            title: Text(
                              user.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () =>
                                  context.read<UserCubit>().deleteUser(user),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: state.users.length)
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'No users found.\nTap the button below to add a user.',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(fontSize: 20),
                        ),
                      );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showUserCreationDialog(context),
        child: Icon(Icons.person_add),
      ),
    );
  }
}
