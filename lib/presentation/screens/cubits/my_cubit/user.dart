import 'package:flutter/material.dart';

class User{
  final String category;
  final DateTime calendar;
  final String title;
  final String description;
  final int money;
  final String icon;
  final bool changes;

  User({
   required this.category,
   required this.calendar,
   required this.title,
   required this.description,
    required this.money,
    required this.icon,
    required this.changes
});
}