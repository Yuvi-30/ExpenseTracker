import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';
import 'external_theme.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ExternalTheme.futuristicTheme,
      home: Expenses(),
    )
  );
}
