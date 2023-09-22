import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vedioandphotosedited/Utils/Show_Notification.dart';
import 'package:video_compress/video_compress.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';



class comprssorPage extends StatefulWidget {
  comprssorPage({Key? key, this.file}) : super(key: key);
  var file;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<comprssorPage> {
  String _counter = 'video';

  Future<void> _compressVideo() async {

    await VideoCompress.setLogLevel(0);
    final info = await VideoCompress.compressVideo(
      widget.file,
      quality: VideoQuality.Res640x480Quality,
      deleteOrigin: false,
      includeAudio: true,

    );
    print(info!.path);
    // print(info!.)
    var downloadsPath = Platform.isIOS
        ? await getExternalStorageDirectory()
        : await getExternalStorageDirectory();

    print(downloadsPath);
    var datetime = DateTime.now();
    final pathOfImage =
    await File('${downloadsPath!.path}/${datetime}_compressed.jpeg')
        .create();


    shownotification('Compressor', 'video compressed');


    GallerySaver.saveVideo(info.path!);

    setState(() {
      _counter = info.path!;
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _compressVideo();
  }
  @override
  Widget build(BuildContext context) {
    print("in 32479_23432");
    print(widget.file);

    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'compressing the video',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            InkWell(
                child: Container(
                  color: Colors.red,
                  child: Icon(
                    Icons.cancel,
                    size: 55,
                  ),
                ),
                onTap: () {
                  VideoCompress.cancelCompression();
                }),

          ],
        ),
      ),
    );
  }
}


//yaml packages

// dev_dependencies:
// flutter_test:
// sdk: flutter
//
//
// flutter_lints: ^2.0.0
// image_picker: ^0.8.5+3
// fluttertoast: ^8.0.9
// permission_handler: ^10.0.1
// flutter_image_compress: ^1.1.3
// path_provider: ^2.0.11
// url_launcher: ^6.1.6
// flutter_local_notifications: ^11.0.1
// flutter_share: ^2.0.0
// #  firebase_core: ^1.24.0
// #  cloud_firestore: ^3.5.1
// ffmpeg_kit_flutter_min_gpl: ^5.1.0
// #  google_mobile_ads: ^2.3.0
// gallery_saver: ^2.3.2
// in_app_review: ^2.0.6
// video_compress: ^3.1.2
// video_thumbnail: ^0.5.3
// file_picker: ^5.5.0
// video_player: ^2.7.2
