import 'package:flutter/material.dart';

class Event {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final String date;

  const Event(
      {required this.id,
        required this.name,
        required this.description,
        required this.imageUrl,
        required this.date});
}
