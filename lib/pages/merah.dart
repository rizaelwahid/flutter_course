import 'package:flutter/material.dart';

import 'amber.dart';

class Merah extends StatelessWidget {
  const Merah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
      child: Amber(),
    );
  }
}
