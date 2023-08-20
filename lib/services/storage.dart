import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> uploadFile(String path, String fileName) async {
    print('Uploading file: $fileName');
    File file = File(path);
    try {
      await _storage
          .ref('${DateTime.now().millisecondsSinceEpoch}-$fileName')
          .putFile(file);
    } on FirebaseException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<int> getNumberOfFiles() async {
    final ListResult result = await _storage.ref().listAll();
    return result.items.length;
  }
}

mixin firebase_storage {}
