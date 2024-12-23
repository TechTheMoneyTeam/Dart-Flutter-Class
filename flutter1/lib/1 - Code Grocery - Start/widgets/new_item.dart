import 'package:flutter/material.dart';
import '../models/grocery_category.dart';

class NewItem extends StatefulWidget {
  final void Function(String name, int quantity, GroceryCategory category) onAddItem;

  const NewItem({super.key, required this.onAddItem});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  String _enteredName = '';
  int _enteredQuantity = 1;
  GroceryCategory _selectedCategory = GroceryCategory.values.first;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onAddItem(_enteredName, _enteredQuantity, _selectedCategory);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                validator: (value) {
                  if (value == null || value.trim().isEmpty || value.length >= 50) {
                    return 'must be between 1 and 50 character';
                  }
                  return null;
                },
                onChanged: (value) => _enteredName = value,
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(label: Text('Quantity')),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        final quantity = int.tryParse(value ?? '');
                        if (quantity == null || quantity <= 0) {
                          return 'must be positive number';
                        }
                        return null;
                      },
                      onChanged: (value) =>
                          _enteredQuantity = int.tryParse(value) ?? 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      value: _selectedCategory,
                      items: GroceryCategory.values.map((category) {
                        return DropdownMenuItem<GroceryCategory>(
                          value: category,
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: category.color,
                              ),
                              const SizedBox(width: 6),
                              Text(category.label),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        _enteredName = '';
                        _enteredQuantity = 1;
                        _selectedCategory = GroceryCategory.values.first;
                      });
                    },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
