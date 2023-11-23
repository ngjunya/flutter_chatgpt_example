// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      profile: ChatCompletionResponse.fromJson(
          json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'profile': instance.profile,
    };

ChatCompletionResponse _$ChatCompletionResponseFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionResponse(
      id: json['id'] as String?,
      object: json['object'] as String?,
      created: json['created'] as int?,
      model: json['model'] as String?,
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => ChatChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatCompletionResponseToJson(
        ChatCompletionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'usage': instance.usage,
      'choices': instance.choices,
    };

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
      promptTokens: json['promptTokens'] as int?,
      completionTokens: json['completionTokens'] as int?,
      totalTokens: json['totalTokens'] as int?,
    );

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
      'promptTokens': instance.promptTokens,
      'completionTokens': instance.completionTokens,
      'totalTokens': instance.totalTokens,
    };

ChatChoice _$ChatChoiceFromJson(Map<String, dynamic> json) => ChatChoice(
      message: json['message'] == null
          ? null
          : ChatMessage.fromJson(json['message'] as Map<String, dynamic>),
      model: json['model'] as String?,
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
      finishReason: json['finishReason'] as String?,
      index: json['index'] as int?,
    );

Map<String, dynamic> _$ChatChoiceToJson(ChatChoice instance) =>
    <String, dynamic>{
      'message': instance.message,
      'model': instance.model,
      'usage': instance.usage,
      'finishReason': instance.finishReason,
      'index': instance.index,
    };

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
