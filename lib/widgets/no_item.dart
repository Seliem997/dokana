import 'package:flutter/material.dart';

import '../services/utils.dart';

class NoItems extends StatelessWidget {
  const NoItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset(
              'assets/images/box.png',
            ),
          ),
          Text(
            'No products on sale yet!,\nStay tuned',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Utils(context).color,
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
