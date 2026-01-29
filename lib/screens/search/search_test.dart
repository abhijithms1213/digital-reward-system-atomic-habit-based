import 'package:flutter/material.dart';

class SearchTest extends StatefulWidget {
  const SearchTest({super.key});

  @override
  State<SearchTest> createState() => _SearchTestState();
}

class _SearchTestState extends State<SearchTest> {
  final List<String> fruits = [
    'apple',
    'orange',
    'banana',
    'pineapple',
    'watermelon',
  ];
  List<String> filteredList = [];
  @override
  void initState() {
    filteredList = fruits;
    super.initState();
  }

  onSearch(String query) {
    if (query.isEmpty) {
      filteredList = fruits;
    } else {
      filteredList = fruits.where((fruit) {
        return fruit.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: onSearch,
            decoration: InputDecoration(hintText: "search here")),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Text(filteredList[index]);
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: filteredList.length,
            ),
          ),
        ],
      ),
    );
  }
}
