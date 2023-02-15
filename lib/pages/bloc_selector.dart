import 'package:bloc_starter/bloc/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectorPage extends StatelessWidget {
  const SelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc myUser = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Selector"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // dengan cara biasa
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: myUser,
          //   builder: (context, state) {
          //     return Text("Nama : ${state['name']}");
          //   },
          // ),
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: myUser,
          //   builder: (context, state) {
          //     return Text("Nama : ${state['age']} tahun");
          //   },
          // ),
          // dengan mengggunakan bloc selector
          BlocSelector<UserBloc, Map<String, dynamic>, String>(
            selector: (state) => state['name'],
            builder: (context, state) {
              print("Nama dibuild");
              return Text("Nama : $state");
            },
          ),
          BlocSelector<UserBloc, Map<String, dynamic>, int>(
            selector: (state) => state['age'],
            builder: (context, state) {
              print("Umur dibuild");
              return Text("Nama : $state");
            },
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: (value) => myUser.changeName(value),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  myUser.changeAge(myUser.state["age"] - 1);
                },
                icon: const Icon(Icons.remove_circle),
              ),
              IconButton(
                onPressed: () {
                  myUser.changeAge(myUser.state["age"] + 1);
                },
                icon: const Icon(Icons.add_circle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
