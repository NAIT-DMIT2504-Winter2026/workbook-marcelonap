import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit_test/state/user_cubit.dart';

import '../models/user.dart';

class FirstNamePage extends StatelessWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Name Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return Text(
                  'User name: ${state.user.firstName} ${state.user.lastName}',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user firs name here
        onPressed: () {
          final cubit = BlocProvider.of<UserCubit>(context);
          final newUser = User('Jezebel', cubit.state.user.lastName);
          cubit.updateUser(newUser);
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
