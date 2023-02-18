import 'package:chat_gpt_app/imports/imports.dart';
import 'package:flutter/material.dart';

Widget myTextFormField(
    {snapshotData, myTap, required ValueChanged<String>? onValueChanged}) {
  TextEditingController controller = TextEditingController();
  if (snapshotData == 'clear') {
    controller.clear();
  }
  return TextFormField(
    style: kStyle12,
    controller: controller,
    decoration: InputDecoration(
      hintText: 'Search here',
      hintStyle: kStyle12,
      filled: true,
      fillColor: kWhite,
      suffixIcon: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          myTap();
        },
      ),
    ),
    onChanged: (v) {
      onValueChanged!(v);
    },
  );
}
