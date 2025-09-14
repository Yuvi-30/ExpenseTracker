// import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

final uuid = Uuid();
enum Category {leisure, work, food, travel}

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.category,
      required this.date})
      : id = uuid.v4();


  final String title;
  final double amount;
  final String id;
  final Category category;
  final DateTime date;

  String get formattedDate{
    return formatter.format(date);
  }
}
