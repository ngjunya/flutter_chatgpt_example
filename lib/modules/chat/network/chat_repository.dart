import 'package:dio/dio.dart';
import 'package:example/core/endpoint/network.dart';
import 'package:example/core/error/network_failure.dart';
import 'package:example/modules/chat/model/chat_response.dart';
import 'package:dartz/dartz.dart';

class ChatRepository {
  final ApiEndpoint apiEndpoint;
  final Dio dioClient;

  ChatRepository({required this.apiEndpoint, required this.dioClient});

  Future<Either<NetworkFailure, ResponseData>> generateResponse(
      String prompt) async {
    Either<NetworkFailure, ResponseData> successORFailure;
    try {
      final response = await apiEndpoint.callApi(dioClient);
      ResponseData newresponse = ResponseData.fromJson(response);
      successORFailure = right(newresponse);
    } on NetworkFailure catch (e) {
      successORFailure = left(e);
    }
    return successORFailure;
  }
}
