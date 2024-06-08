import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class MainUtils {


  static Future<dynamic> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  static bool checkEmptyFields(List<TextEditingController> data) {
    for(TextEditingController element in  data) {
      if(element.text.isEmpty) {
        return true;
      }
    }
    return false;
  }

  static void showErrorSnackBar(String message, {Color? background}) {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(seconds: 3),
      message: message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: background ?? Colors.redAccent.shade700,
    ));
  }

  static void showTopErrorSnackBar(String message) {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(seconds: 3),
      message: message,
      backgroundColor: Colors.redAccent.shade200,
    ));
  }

  static void showSuccessSnackBar(String message, {Color? backgroundColor}) {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(seconds: 3),
      message: message,
      backgroundColor: backgroundColor ?? Colors.green.shade400,
    ));
  }

  // static Future<File?> compressAndGetFile(File file) async {
  //   var result = await FlutterImageCompress.compressAndGetFile(
  //     file.absolute.path,
  //     "${file.path}compressed.jpg",
  //     quality: 20,
  //     rotate: 0,
  //   );
  //
  //   print("original file size: ${file.lengthSync()}");
  //
  //   if(result == null) {
  //     return null;
  //   }

  //   File compressedFile = File(result!.path);
  //   print("compressed file size: ${compressedFile!.lengthSync()}");
  //
  //   return compressedFile;
  // }

  // static Future<File?> compressFile(File file) async {
  //   int quality = 100; // Initial quality value
  //   int maxSizeKB = 500;
  //
  //   File? compressedFile;
  //
  //   do {
  //     var result = await FlutterImageCompress.compressAndGetFile(
  //       file.absolute.path,
  //       "${file.path}_compressed.jpg",
  //       quality: quality,
  //       rotate: 0,
  //     );
  //
  //     if (result == null) {
  //       return null;
  //     }
  //
  //     compressedFile = File(result.path);
  //
  //     int fileSizeKB = compressedFile.lengthSync() ~/ 1024;
  //
  //     if (fileSizeKB <= maxSizeKB) {
  //       break;
  //     } else {
  //       quality -= 10;
  //     }
  //   } while (quality > 0);
  //
  //   print("Original file size: ${file.lengthSync()} KB");
  //   print("Compressed file size: ${compressedFile!.lengthSync()} KB");
  //
  //   return compressedFile;
  // }

  static Future<File> downloadFile(String url, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    final response = await http.get(Uri.parse(url));
    return await File(filePath).writeAsBytes(response.bodyBytes);
  }

}
