import 'package:flutter/material.dart';

class LocalSearchExample extends StatefulWidget {
  const LocalSearchExample({super.key});

  @override
  State<LocalSearchExample> createState() => _LocalSearchExampleState();
}

class _LocalSearchExampleState extends State<LocalSearchExample> {
  // 1️⃣ Original list (never modify this)
  final List<String> allItems = [
    'Apple',
    'Banana',
    'Orange',
    'Grapes',
    'Mango',
    'Pineapple',
  ];

  // 2️⃣ Filtered list (shown in UI)
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems; // initially show all
  }

  // 3️⃣ Search logic
  void searchItem(String query) {
    if (query.isEmpty) {
      filteredItems = allItems;
    } else {
      filteredItems = allItems
          .where(
            (item) =>
                item.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local Search')),
      body: Column(
        children: [
          // 🔍 Search field
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: searchItem,
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // 📋 Result list
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredItems[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
