import 'package:flutter/material.dart';
import 'package:provider_exemple/bloc/user_bloc.dart';
import 'package:provider_exemple/bloc/user_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = context.read<UserBloc>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              userBloc.add(UserLoadEvent());
            },
            child: Text("Load",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.apply(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          ElevatedButton(
            onPressed: () {
              userBloc.add(UserClearEvent());
            },
            child: Text("Clear", style: Theme.of(context).textTheme.headline5),
            style: ElevatedButton.styleFrom(
              primary: Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }
}
