import 'package:chat_gpt_app/imports/imports.dart';
import 'package:flutter/material.dart';

class AnimatedLoading extends StatefulWidget {
  const AnimatedLoading({Key? key}) : super(key: key);

  @override
  State<AnimatedLoading> createState() => _AnimatedLoadingState();
}

class _AnimatedLoadingState extends State<AnimatedLoading>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _currentIndex++;
          if (_currentIndex == 3) {
            _currentIndex = 0;
          }
          _animationController!.reset();
          _animationController!.forward();
        }
      });
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return Container(
          alignment: Alignment.topCenter,
          width: maxWidth(context),
          height: 12.0,
          child: ListView.builder(
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 5.0,
                        backgroundColor: kWhite
                            .withOpacity(index == _currentIndex ? 1.0 : 0.2),
                      ),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
