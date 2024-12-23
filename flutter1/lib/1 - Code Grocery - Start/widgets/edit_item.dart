import 'package:flutter/material.dart';
import '../models/grocery_category.dart';

class EditItem extends StatefulWidget {
  final void Function(String name, int quantity, GroceryCategory category, String? id) onEditItem;
  final String? initialName;
  final int? initialQuantity;
  final GroceryCategory? initialCategory;
  final String? id;

  const EditItem({
    super.key,
    required this.onEditItem,
    this.initialName,
    this.initialQuantity,
    this.initialCategory,
    this.id,
  });

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  final _formKey = GlobalKey<FormState>();
  late String _enteredName;
  late int _enteredQuantity;
  late GroceryCategory _selectedCategory;

  @override
  void initState() {
    super.initState();
    // Initialize fields with provided values or defaults
    _enteredName = widget.initialName ?? '';
    _enteredQuantity = widget.initialQuantity ?? 1;
    _selectedCategory = widget.initialCategory ?? GroceryCategory.values.first;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onEditItem(_enteredName, _enteredQuantity, _selectedCategory, widget.id);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _enteredName,
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                onChanged: (value) => _enteredName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _enteredQuantity.toString(),
                      decoration: const InputDecoration(label: Text('Quantity')),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        final quantity = int.tryParse(value ?? '');
                        if (quantity == null || quantity <= 0) {
                          return 'Must be a positive number';
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
                        _enteredName = widget.initialName ?? '';
                        _enteredQuantity = widget.initialQuantity ?? 1;
                        _selectedCategory = widget.initialCategory ?? GroceryCategory.values.first;
                      });
                    },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Save Changes'),
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
