import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ImageuploadCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'imageupload',
      apiUrl:
          'https://api.imgbb.com/1/upload?key=67f42de0c3ccb35dd7b0a6e0fbcef160',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic imagepath(dynamic response) => getJsonField(
        response,
        r'''$.data.url''',
      );
}

class SendMailCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send Mail',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send?ref=ramarmarnocode.fr',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadImgImgbbCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? imageVar,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Upload img imgbb',
      apiUrl:
          'https://api.imgbb.com/1/upload?key=587838482d240c85bfd0cb13325b6ac5',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': imageVar,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic imgURL(dynamic response) => getJsonField(
        response,
        r'''$.data.url''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
