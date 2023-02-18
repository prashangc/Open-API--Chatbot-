import 'package:chat_gpt_app/imports/imports.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatefulWidget {
  String text;
  String sender;
  ChatMessage({
    Key? key,
    required this.sender,
    required this.text,
  }) : super(key: key);

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5.0),
          child: CircleAvatar(
            backgroundColor: widget.sender == 'User' ? kBlue : kAmber,
            child: Text(widget.sender[0]),
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.sender, style: kStyle12.copyWith(color: kWhite)),
              Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    widget.text,
                    style: kStyle12.copyWith(color: kWhite),
                  )),
            ],
          ),
        ))
      ],
    );
  }
}
