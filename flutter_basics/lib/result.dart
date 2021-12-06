import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String result;
  Result({@required this.result});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(this.result),
    );
  }
}
