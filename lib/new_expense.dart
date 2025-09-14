import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/expense.dart';

final formatter = DateFormat.yMMMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final textController = TextEditingController();
  final amtController = TextEditingController();
  DateTime? _setDate;
  Category _selectedCategory = Category.leisure; // default value

  String categoryToText(Category category) {
    switch (category) {
      case Category.leisure:
        return "Leisure";
      case Category.work:
        return "Work";
      case Category.food:
        return "Food";
      case Category.travel:
        return "Travel";
    }
  }

  @override
  void dispose() {
    amtController.dispose();
    textController.dispose();
    super.dispose();
  }

  void _presentDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    if (picked == null) return;

    setState(() {
      _setDate = picked;
    });
  }

  void _checkValid() {
    final amt = double.tryParse(amtController.text);
    final txt = textController.text.trim();

    final isInvalid =
        (amt == null || amt <= 0 || txt.isEmpty || _setDate == null);

    if (isInvalid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please don\'t leave any field empty'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okie'),
            )
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(Expense(
        title: txt, amount: amt, category: _selectedCategory, date: _setDate!));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // stretch children
        children: [
          TextField(
            controller: textController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Add Title'),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amtController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Add Amount',
                    prefixText: 'Rs. ',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _setDate == null
                          ? "Select a Date"
                          : formatter.format(_setDate!),
                    ),
                    IconButton(
                      onPressed: _presentDate,
                      icon: const Icon(Icons.calendar_month_rounded),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton<Category>(
                value: _selectedCategory,
                items: Category.values.map((cat) {
                  return DropdownMenuItem(
                    value: cat,
                    child: Text(categoryToText(cat)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  _checkValid();
                },
                child: const Text('Submit'),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
