import 'package:chat_gpt_app/api/api.dart';
import 'package:chat_gpt_app/imports/imports.dart';
import 'package:chat_gpt_app/screens/chatGpt/ChatMessages.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  String? _search;
  final List<ChatMessage> _messagesList = [];
  StateHandlerBloc listViewStateBloc = StateHandlerBloc();
  StateHandlerBloc clearSearchBloc = StateHandlerBloc();
  StateHandlerBloc searchingBloc = StateHandlerBloc();
  sendMessage() async {
    ChatMessage message = ChatMessage(sender: 'User', text: _search!);
    _messagesList.insert(0, message);
    listViewStateBloc.storeData('data');
    clearSearchBloc.storeData('clear');
    searchingBloc.storeData(true);
    await API().generateResponse(_search!).then((value) {
      _messagesList.insert(
        0,
        ChatMessage(
          text: value,
          sender: 'Bot',
        ),
      );
    });
    searchingBloc.storeData(false);
    listViewStateBloc.storeData('data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: myCustomAppBar(
        title: 'Chat GPT',
        color: kBlack.withOpacity(0.8),
        showPop: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<dynamic>(
                  stream: listViewStateBloc.stateStream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _messagesList.length,
                      reverse: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (ctx, i) {
                        return Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: _messagesList[i]);
                      },
                    );
                  }),
            ),
            const SizedBox12(),
            StreamBuilder<dynamic>(
                initialData: false,
                stream: searchingBloc.stateStream,
                builder: (context, snapshot) {
                  if (snapshot.data == false) {
                    return Container();
                  } else {
                    return Column(
                      children: [
                        Text('Searching',
                            style: kStyle12.copyWith(color: kWhite)),
                        const SizedBox8(),
                        const AnimatedLoading(),
                        const SizedBox8(),
                      ],
                    );
                  }
                }),
            searchCard(),
            const SizedBox8(),
          ],
        ),
      ),
    );
  }

  Widget searchCard() {
    return Row(
      children: [
        Expanded(
          child: StreamBuilder<dynamic>(
              stream: clearSearchBloc.stateStream,
              builder: (context, snapshot) {
                return myTextFormField(
                    snapshotData: snapshot.data,
                    myTap: () {
                      clearSearchBloc.storeData('clear');
                    },
                    onValueChanged: (v) {
                      _search = v;
                    });
              }),
        ),
        const SizedBox8(),
        Container(
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: IconButton(
            onPressed: () {
              sendMessage();
            },
            icon: const Icon(Icons.send),
          ),
        ),
      ],
    );
  }
}
