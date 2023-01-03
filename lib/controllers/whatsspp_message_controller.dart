import 'package:attandence_admin_panel/services/whatssapp_api_services/whatsapp_api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class WhatsappMessageController extends GetxController {
  WhatsappMessageApi whatsappMessageApi = WhatsappMessageApi();

  RxBool isLoading = false.obs;

  sendMarkList({
    required String name,
    required String examName,
    required String maths,
    required String phone,
    required String english,
    required String tamil,
  }) async {
    isLoading(true);
    Map data = {
      "messaging_product": "whatsapp",
      "to": "91$phone",
      "type": "template",
      "template": {
        "name": "mark_sheets",
        "language": {"code": "en_US"},
        "components": [
          {
            "type": "body",
            "parameters": [
              {"type": "text", "text": name},
              {"type": "text", "text": examName},
              {"type": "text", "text": maths},
              {"type": "text", "text": english},
              {"type": "text", "text": tamil}
            ]
          }
        ]
      }
    };

    dio.Response<dynamic> response =
        await whatsappMessageApi.whatsAppMessageApi(data);
    isLoading(false);
    if (response.statusCode == 200) {
      Get.snackbar(
          maxWidth: 400,
          "Message send Successfully",
          "",
          colorText: Colors.white,
          backgroundColor: Colors.green);
    } else {
      Get.snackbar(
          maxWidth: 400,
          "Unable to send Message",
          "",
          colorText: Colors.white,
          backgroundColor: Colors.red);
    }
  }



  sendPlainText(String text, String mobile) async {
    Map data = {
      "messaging_product": "whatsapp",
      "to": "91$mobile",
      "type": "text",
      "text": {"body": String}
    };
  }



  sendWhatsappAsText({
    required String name,
    required String phone,
    required String examName,
    required String mark1,
    required String mark2,
    required String mark3,
    required String mark4,
    required String mark5,
    required String mark6,
  }) async {
    isLoading(true);
    Map data = {
      "messaging_product": "whatsapp",
      "to": "91$phone",
      "type": "template",
      "template": {
        "name": "mark_sheet_text",
        "language": {"code": "en_US"},
        "components": [
          {
            "type": "body",
            "parameters": [
              {"type": "text", "text": name},
              {"type": "text", "text": examName},
              {"type": "text", "text": mark1},
              {"type": "text", "text": mark2},
              {"type": "text", "text": mark3},
              {"type": "text", "text": mark4},
              {"type": "text", "text": mark5},
              {"type": "text", "text": mark6}
            ]
          }
        ]
      }
    };

    dio.Response<dynamic> response =
        await whatsappMessageApi.whatsAppMessageApi(data);
    isLoading(false);
    if (response.statusCode == 200) {
      Get.snackbar(
          maxWidth: 400,
          "Message send Successfully",
          "",
          colorText: Colors.white,
          backgroundColor: Colors.green);
    } else {
      Get.snackbar(
          maxWidth: 400,
          "Unable to send Message",
          "",
          colorText: Colors.white,
          backgroundColor: Colors.red);
    }
  }



   sendWhatsappAsPDF({
    required String name,
    required String phone,
    required String examName,
    required String url,
  }) async {
    isLoading(true);
    Map data = {
      "messaging_product": "whatsapp",
      "to": "91$phone",
      "type": "template",
      "template": {
        "name": "mark_sheet_pdf",
        "language": {"code": "en_US"},
        "components": [
          {
            "type": "header",
            "parameters": [
              {
        "type": "document",
        "document": {
          "link": "https://firebasestorage.googleapis.com/v0/b/vmhsschool-88969.appspot.com/o/report.pdf?alt=media&token=b3667cb7-476c-455d-8b96-c082bc0213ba",
          "filename": "Mark Sheet"
        }
        },]
          },
          {
            "type": "body",
            "parameters": [
              {"type": "text", "text": name},
              {"type": "text", "text": examName},
            ]
          }
        ]
      }
    };

    dio.Response<dynamic> response =
        await whatsappMessageApi.whatsAppMessageApi(data);
    isLoading(false);
    if (response.statusCode == 200) {
      Get.snackbar(
          maxWidth: 400,
          "Message send Successfully",
          "",
          colorText: Colors.white,
          backgroundColor: Colors.green);
    } else {
      Get.snackbar(
          maxWidth: 400,
          "Unable to send Message",
          "",
          colorText: Colors.white,
          backgroundColor: Colors.red);
    }
  }

}
