import 'dart:math';

import 'package:expense_tracker/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/expense_item.dart';
class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        final exp = expenses[index];
        return Dismissible(
          key: ValueKey(exp.id), // ✅ each expense should have a unique id
          direction: DismissDirection.endToStart, // swipe from right to left
          confirmDismiss: (direction) async {
            // Show confirm dialog OR allow delete after half swipe
            return await showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Confirm Delete'),
                content: const Text('Are you sure you want to delete this expense?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(false),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(ctx).pop(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Delete'),
                  ),
                ],
              ),
            );
          },
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${exp.title} deleted'),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 28,
            ),
          ),
          child: ExpenseItem(exp),
        );
      },
    );
  }

}
