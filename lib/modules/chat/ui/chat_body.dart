import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/chat_bloc.dart';
import '../../../core/util/colors.dart';
import 'chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  StreamSubscription? connectivityStream;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(context),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "OpenAI's ChatGPT Flutter Example \n@ngjunya",
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: ColorSets.botBackgroundColor,
        ),
        backgroundColor: ColorSets.backgroundColor,
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: _buildList(state),
                  ),
                  Visibility(
                    visible: state.isSubmit,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildInput(),
                        _buildSubmit(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSubmit() {
    return Builder(builder: (context) {
      return Visibility(
        visible: !context.read<ChatBloc>().state.isSubmit,
        child: Container(
          color: ColorSets.botBackgroundColor,
          child: IconButton(
            icon: const Icon(
              Icons.send_rounded,
              color: Color.fromRGBO(142, 142, 160, 1),
            ),
            onPressed: () async {
              context.read<ChatBloc>().add(
                    ChatEvent.submitChat(_textController.text),
                  );
              _textController.clear();
            },
          ),
        ),
      );
    });
  }

  Expanded _buildInput() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: Colors.white),
        controller: _textController,
        decoration: const InputDecoration(
          fillColor: ColorSets.botBackgroundColor,
          filled: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  ListView _buildList(ChatState state) {
    return ListView.builder(
      itemCount: state.messages.length,
      itemBuilder: (context, index) {
        var message = state.messages[index];
        return ChatMessageWidget(
          text: message.text,
          chatMessageType: message.chatMessageType,
        );
      },
    );
  }
}
