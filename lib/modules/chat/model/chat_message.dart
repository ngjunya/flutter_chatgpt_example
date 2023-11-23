import '../../../core/util/enum.dart';

class ChatMessage {
  ChatMessage({
    required this.text,
    required this.chatMessageType,
  });

  final String text;
  final ChatMessageType chatMessageType;
}
