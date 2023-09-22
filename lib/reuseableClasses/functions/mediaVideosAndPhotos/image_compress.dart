import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import '../../../vedioAndPhotosEdited/lib/Utils/Show_Notification.dart';



class ImageCompress {
  static Future<File?> ImageCompressAndGetFile(
      File file, String targetPath, double quality) async {
    try {
      var perquality;
      if (quality <= 50) {
        perquality = 20;
      } else if (quality >= 50) {
        perquality = 34;
      }

      var appDocDir = await getExternalStorageDirectory();
      var folderPath = '${appDocDir!.path}/0/RamezCompressed/photos';
      Directory(folderPath).createSync(recursive: true);

      var datetime = DateTime.now();
      final pathOfImage =
      File('$folderPath/${datetime}_compressed.jpeg');

      var result = await FlutterImageCompress.compressWithFile(
        file.absolute.path,
        quality: perquality,
        format: CompressFormat.jpeg,
      );
      await pathOfImage.writeAsBytes(result!);

      GallerySaver.saveImage(pathOfImage.path);

      return pathOfImage;
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: 'Compression failed');
    }
  }
}
