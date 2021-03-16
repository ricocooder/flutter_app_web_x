import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


colorPicker({String colornumber})  {
  if (colornumber == 'Proszki' ) {
    return Color(4292030255);
  }
  if (colornumber == 'Process') {
    return Colors.lightBlue[400];
  }
  if (colornumber == 'Filing') {
    return Color(4294278935);
  }
  if (colornumber == 'PKG_MPG') {
    return Color(4281236786);
  }
  if (colornumber == 'Utilities') {
    return Color(4285353025);
  }
  else {
    return Colors.white24;
  }
}



