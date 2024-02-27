import 'package:flutter/material.dart';

enum ImageEnum {
  flagTr('tr'),
  flagEn('en'),
  flagDe('de'),
  flagSp('sp');

  final String value;
  const ImageEnum(this.value);

  String get toImage => 'assets/images/im_$value.png';
  String get toFlag => 'assets/flags/fl_$value.png';

  Image get flatToImage => Image.asset(toImage);
}
