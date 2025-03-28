import 'package:flutter/material.dart';

//This is a file that contains all the image paths in the app
//All variables are static and immutable, should be wrapped by base path
//All images should be in the assets/images folder
@immutable
final class ImagePaths {
  static const String base = "assets/images";
  static const String book = "$base/book.png";
  static const String delete = "$base/delete.png";
}
