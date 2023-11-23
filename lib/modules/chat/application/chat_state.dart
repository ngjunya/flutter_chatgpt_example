part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState(
      {required bool isSubmit,
      required List<ChatMessage> messages}) = _ChatState;

  factory ChatState.initial() => const ChatState(isSubmit: false, messages: []);
}
