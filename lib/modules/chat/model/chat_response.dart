import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_response.g.dart';

@JsonSerializable()
class ResponseData {
  final ChatCompletionResponse profile;
  ResponseData({required this.profile});
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable()
class ChatCompletionResponse {
  final String? id;
  final String? object;
  final int? created;
  final String? model;
  final Usage? usage;
  final List<ChatChoice>? choices;

  ChatCompletionResponse({
    this.id,
    this.object,
    this.created,
    this.model,
    this.usage,
    this.choices,
  });

  factory ChatCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatCompletionResponseToJson(this);
}

@JsonSerializable()
class Usage {
  final int? promptTokens;
  final int? completionTokens;
  final int? totalTokens;

  Usage({
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
  Map<String, dynamic> toJson() => _$UsageToJson(this);
}

@JsonSerializable()
class ChatChoice {
  final ChatMessage? message;
  final String? model;
  final Usage? usage;
  final String? finishReason;
  final int? index;

  ChatChoice({
    this.message,
    this.model,
    this.usage,
    this.finishReason,
    this.index,
  });

  factory ChatChoice.fromJson(Map<String, dynamic> json) =>
      _$ChatChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$ChatChoiceToJson(this);
}

@JsonSerializable()
class ChatMessage {
  final String role;
  final String content;

  ChatMessage({
    required this.role,
    required this.content,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}
