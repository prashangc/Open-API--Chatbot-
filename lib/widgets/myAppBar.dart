import 'package:chat_gpt_app/imports/imports.dart';
import 'package:flutter/material.dart';

class myCustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showPop;
  final Color color;
  const myCustomAppBar(
      {Key? key,
      required this.title,
      required this.color,
      required this.showPop})
      : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(70);
  @override
  State<myCustomAppBar> createState() => _myCustomAppBarState();
}

class _myCustomAppBarState extends State<myCustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: maxWidth(context),
          decoration: BoxDecoration(
            color: widget.color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 70,
                child: Center(
                  child: Text(
                    widget.title.toString(),
                    style: kStyle14Bold.copyWith(color: kWhite, fontSize: 17.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 12.0,
          left: 12.0,
          child: widget.showPop == false
              ? Container()
              : SizedBox(
                  width: 65,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 50,
                        margin: const EdgeInsets.only(right: 15.0, top: 12),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: kWhite,
                          size: 35.0,
                        )),
                  ),
                ),
        )
      ],
    );
  }
}
