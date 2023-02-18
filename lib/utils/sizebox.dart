import 'package:flutter/material.dart';

double maxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double maxHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

class SizedBox2 extends StatelessWidget {
  const SizedBox2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 2.0,
    );
  }
}

class SizedBox12 extends StatelessWidget {
  const SizedBox12({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 12.0,
    );
  }
}

class SizedBox16 extends StatelessWidget {
  const SizedBox16({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16.0,
    );
  }
}

class SizedBox8 extends StatelessWidget {
  const SizedBox8({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 8.0,
      width: 8.0,
    );
  }
}

class SizedBox24 extends StatelessWidget {
  const SizedBox24({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 24.0,
    );
  }
}

class SizedBox32 extends StatelessWidget {
  const SizedBox32({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 32.0,
    );
  }
}
