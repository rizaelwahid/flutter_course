import 'package:bloc_starter/bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';
import 'merah.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Counter myCounter = BlocProvider.of<Counter>(context);
    CounterBloc myCounter = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Depedency Injection'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/other");
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => BlocProvider.value(
          //       value: myCounter,
          //       child: const OtherPage(),
          //     ),
          //   ),
          // );
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.green,
                  child: InkWell(
                    onTap: () {
                      myCounter.decrement();
                    },
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Merah(),
                Material(
                  color: Colors.green,
                  child: InkWell(
                    onTap: () {
                      myCounter.increment();
                    },
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BlocBuilder<ThemeBloc, bool>(
              builder: (context, state) {
                return Text("$state");
              },
            ),
            Material(
              color: Colors.cyan,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/blocSlector");
                },
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Text(
                      "Bloc Selector",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
