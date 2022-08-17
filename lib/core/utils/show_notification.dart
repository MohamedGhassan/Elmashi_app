import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int? id;
  final String? title;
  final String? body;
  final String? payload;
}


