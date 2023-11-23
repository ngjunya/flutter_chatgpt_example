import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:example/core/endpoint/network.dart';
import 'package:example/core/util/enum.dart';
import 'package:example/core/util/toast.dart';
import 'package:example/modules/chat/network/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/injection/injection_container.dart';
import '../../../core/util/constant.dart';
import '../model/chat_message.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final BuildContext context;
  ChatBloc(this.context) : super(ChatState.initial()) {
    on<ChatEvent>((event, emit) async {
      //openai's API
      ApiEndpoint apiEndpoint = locator<ApiEndpoint>();
      apiEndpoint.path = "https://api.openai.com/v1/chat/completions";
      apiEndpoint.type = ApiType.apiPost;
      apiEndpoint.apiKey = apiSecretKey;
      apiEndpoint.body = json.encode({
        "model": "text-davinci-003",
        "prompt": event.content,
        'temperature': 0,
        'max_tokens': 2000,
        'top_p': 1,
        'frequency_penalty': 0.0,
        'presence_penalty': 0.0,
      });
      final Dio dioClient = await locator
          .get<DioConfiguration>()
          .getClient(baseUrl: "", retry: false);

      //sample API
      // ApiEndpoint apiEndpoint = locator<ApiEndpoint>();
      // apiEndpoint.path = "/ngjunya/demo/db";
      // apiEndpoint.type = ApiType.apiGet;
      // final Dio dioClient = await locator.get<DioConfiguration>().getClient(
      //     baseUrl: "https://my-json-server.typicode.com/", retry: false);
      emit(state.copyWith(isSubmit: true));
      emit(state.copyWith(messages: [
        ...state.messages,
        ChatMessage(text: event.content, chatMessageType: ChatMessageType.user)
      ]));
      await ChatRepository(apiEndpoint: apiEndpoint, dioClient: dioClient)
          .generateResponse(event.content)
          .then((value) {
        if (value.isRight()) {
          emit(state.copyWith(messages: [
            ...state.messages,
            ChatMessage(
              text: value.fold((l) => "",
                  (r) => r.profile.choices![0].message?.content ?? ""),
              chatMessageType: ChatMessageType.bot,
            ),
          ]));
        } else {
          emit(state.copyWith(isSubmit: false));
          showErrorToast("Something is wrong ! ", context: context);
        }
      });
      emit(state.copyWith(isSubmit: false));
    });
  }
}
