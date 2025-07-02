import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class DatabaseStorageServices {
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadUserImage(File image, String uuid) async {
    try {
      var reference = _storage.ref().child("UserProfilesImages/$uuid");
      var uploadImage = reference.putFile(image);
      TaskSnapshot snapshot =
          await uploadImage.whenComplete(() => print('Image Uploaded'));
      final imageUrl = snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Exception@uploadUserImage=> $e");
      return null;
    }
  }
}
