import 'package:flutter/material.dart';

import 'biru.dart';

class Amber extends StatelessWidget {
  const Amber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 200,
      height: 100,
      color: Colors.amber,
      child: const Biru(),
    );
  }
}
