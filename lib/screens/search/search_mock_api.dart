import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final String category;

  Product({required this.id, required this.name, required this.category});
}

class ProductApiSearch {
  // mock data
  final List<Product> _mockDb = [
    Product(id: 1, name: 'iPhone', category: 'Mobile'),
    Product(id: 2, name: 'Samsung Galaxy', category: 'Mobile'),
    Product(id: 3, name: 'MacBook Pro', category: 'Laptop'),
    Product(id: 4, name: 'HP Pavilion', category: 'Laptop'),
    Product(id: 5, name: 'iPad', category: 'Tablet'),
  ];
  Future<List<Product>> fetchProducts({String? query}) async {
    if (query == null || query.isEmpty) {
      await Future.delayed(Duration(seconds: 1));
      return _mockDb;
    }
    return _mockDb.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}

class TestMockAPiScreen extends StatefulWidget {
  const TestMockAPiScreen({super.key});

  @override
  State<TestMockAPiScreen> createState() => _TestMockAPiScreenState();
}

class _TestMockAPiScreenState extends State<TestMockAPiScreen> {
  final ProductApiSearch productApiSearch = ProductApiSearch();
  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  List<Product> filtered = [];
  bool isLoading = false;
  Future fetchProducts() async {
    isLoading = true;
    setState(() {});
    List<Product> products = await productApiSearch.fetchProducts();
    filtered = products;
    isLoading = false;
    setState(() {});
  }

  Future searchProducts(String query) async {
    isLoading = true;
    setState(() {});
    Future.delayed(Duration(seconds: 1));
    List<Product> searchProducts = await productApiSearch.fetchProducts(
      query: query,
    );
    filtered = searchProducts;
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: searchProducts,
            decoration: InputDecoration(hintText: "search here"),
          ),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Text(filtered[index].name);
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: filtered.length,
                  ),
                ),
        ],
      ),
    );
  }
}
