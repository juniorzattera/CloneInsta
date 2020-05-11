import 'package:rxdart/rxdart.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';


class CameraController extends BlocBase {
  @override
  void dispose() {
  }  
  File _image;
  BehaviorSubject<File> fotoCamera = new BehaviorSubject<File>();
  Stream<File> get outFoto => fotoCamera.stream;
  Sink<File> get inFoto => fotoCamera.sink;

  tirarFoto(){
    ImagePicker.pickImage(source: ImageSource.camera).then((file) {
      _image = file;
      inFoto.add(_image);
    });

  }
}