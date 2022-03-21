import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int randomID() {
  // random integer generator
  int res = 100 + math.Random().nextInt(900000 - 100000);
  return res;
}

double setValue(String value) {
  // Add your function code here!
  if (value == "Credit") {
    return 1000;
  } else {
    return 0;
  }
}
