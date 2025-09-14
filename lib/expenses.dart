import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  final List<Expense> _registerdExpenses = [
  ];

  void _openAddOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense){
    setState(() {
      _registerdExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    setState(() {
      _registerdExpenses.remove(expense);
    });
  }

  double get totalWeeklyExpenses {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));

    return _registerdExpenses
        .where((expense) => expense.date.isAfter(weekStart))
        .fold(0, (sum, expense) => sum + expense.amount);
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('Add Some New Expenses!!'),
    );
    if(_registerdExpenses.isNotEmpty){
      mainContent = ExpensesList(expenses: _registerdExpenses, onRemoveExpense: _removeExpense,);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('QuackTrack'),
        actions: [
          IconButton(
            onPressed: _openAddOverlay,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'This Week\'s Total',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Rs. ${totalWeeklyExpenses.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
