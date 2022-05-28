import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_exemple/bloc/user_bloc.dart';
import 'package:provider_exemple/bloc/user_state.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(
            child: Text(
              'No data received. Press button "Load"',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              child: ListTile(
                leading: Text(
                  'ID: ${state.loadedUser[index].id}',
                  style: (Theme.of(context).textTheme.headline4),
                ),
                title: Column(
                  children: <Widget>[
                    Text(
                      '${state.loadedUser[index].name}',
                      style: (Theme.of(context).textTheme.headline5),
                    ),
                    Text(
                      'Email: ${state.loadedUser[index].email}',
                      style: (Theme.of(context).textTheme.headline6),
                    ),
                    Text(
                      'Phone: ${state.loadedUser[index].phone}',
                      style: (Theme.of(context).textTheme.headline6),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is UserErrorState) {
          return Center(
            child: Text('Errror'),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
