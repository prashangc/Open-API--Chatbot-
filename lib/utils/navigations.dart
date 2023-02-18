import 'package:flutter/material.dart';

go(BuildContext context, screen) async {
  final result = await Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) => screen));
  return result;
}
