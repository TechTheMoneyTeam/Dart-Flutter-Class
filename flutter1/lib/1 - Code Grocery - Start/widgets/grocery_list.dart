import 'package:flutter/material.dart';
import '../models/grocery_category.dart';
import '../models/grocery_item.dart';
import '../data/dummy_items.dart';
import './new_item.dart';
import './edit_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addNewItem(String name, int quantity, GroceryCategory category) {
    setState(() {
      dummyGroceryItems.add(
        GroceryItem(
          name: name,
          quantity: quantity,
          category: category,
          id: '',
        ),
      );
    });
  }

  void _editItem(
      String name, int quantity, GroceryCategory category, String? id) {
    setState(() {
      if (id != null) {
        final index = dummyGroceryItems.indexWhere((item) => item.id == id);
        if (index != -1) {
          dummyGroceryItems[index] = GroceryItem(
            name: name,
            quantity: quantity,
            category: category,
            id: id,
          );
        }
      }
    });
  }

  void _onAddPressed() {
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          top: 16,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
        ),
        child: NewItem(
          onAddItem: _addNewItem,
        ),
      ),
    );
  }

  void _onAddPressed2(GroceryItem? selectedItem) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          top: 16,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
        ),
        child: EditItem(
          onEditItem: _editItem,
          initialName: selectedItem?.name ?? '',
          initialQuantity: selectedItem?.quantity ?? 1,
          initialCategory: selectedItem?.category,
          id: selectedItem?.id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items added yet.'),
    );

    if (dummyGroceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (ctx, index) {
          final item = dummyGroceryItems[index];
          return ListTile(
            leading: Container(
              width: 16,
              height: 16,
              color: item.category.color,
            ),
            title: Text(item.name),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => _onAddPressed2(item),
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _onAddPressed,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
