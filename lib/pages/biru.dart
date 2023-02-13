import 'package:flutter/material.dart';

import 'center_data.dart';

class Biru extends StatelessWidget {
  const Biru({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 200,
      height: 100,
      color: Colors.blue,
      child: CenterData(),
    );
  }
}
