import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_exemple/bloc/user_bloc.dart';
import 'package:provider_exemple/services/user_api_provider.dart';
import 'package:provider_exemple/widgets/action_button.dart';
import 'package:provider_exemple/widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(userRepository),
      child: Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          title: Center(
              child: Text('User List',
                  style: (Theme.of(context)
                      .textTheme
                      .headline4
                      ?.apply(color: Colors.brown[850])))),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ActionButton(),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
