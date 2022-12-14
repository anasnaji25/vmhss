import 'dart:io';
import 'package:attandence_admin_panel/constants/auth_whatsapp_token.dart';
import 'package:dio/dio.dart';

class WhatsappMessageApi {
  Future whatsAppMessageApi(Map data) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      var response = await dio.post(
          "https://graph.facebook.com/v15.0/113104421642087/messages",
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $auth_token',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: data);
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  dynamic returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        print("here.>>>>>>>>>>>>");
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 404:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      
    }
  }
}
