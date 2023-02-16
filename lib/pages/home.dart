import 'package:bloc_starter/widgets/setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:bloc_starter/bloc/theme.dart';
import 'package:bloc_starter/widgets/menu_widget.dart';
import 'package:bloc_starter/widgets/user_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../bloc/counter.dart';
import 'merah.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  final List<Widget> _pageList = <Widget>[
    const HomeScreen(),
    const MenuScreen(),
    const UserScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
      body: _pageList[_pageIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.amber),
        ),
        child: CurvedNavigationBar(
          height: 60,
          color: Colors.purple,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.red,
          animationCurve: Curves.linear,
          animationDuration: const Duration(milliseconds: 300),
          items: const [
            Icon(Icons.home, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.person, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Counter myCounter = BlocProvider.of<Counter>(context);
    CounterBloc myCounter = context.read<CounterBloc>();
    return Center(
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
    );
  }
}
