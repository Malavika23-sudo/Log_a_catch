import 'package:flutter/material.dart';

class DividerForOr extends StatelessWidget {
  const DividerForOr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            height: 30,
            thickness: 1.0,
            color: Colors.white,
          ),
        ),
        Text(' Or'),
        Expanded(
          child: Divider(
            height: 30,
            thickness: 1.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
