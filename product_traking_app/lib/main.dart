// main.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const NoWasteApp());
}

class NoWasteApp extends StatelessWidget {
  const NoWasteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No Waste',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green,
          secondary: Colors.teal,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class FoodItem {
  final String name;
  final DateTime expiryDate;
  final String category;
  final String storage; // 'fridge' or 'freezer'

  FoodItem({
    required this.name,
    required this.expiryDate,
    required this.category,
    required this.storage,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<FoodItem> _items = [
    FoodItem(
      name: 'Milk',
      expiryDate: DateTime.now().add(const Duration(days: 1)),
      category: 'Dairy',
      storage: 'fridge',
    ),
    FoodItem(
      name: 'Chicken',
      expiryDate: DateTime.now().add(const Duration(days: 30)),
      category: 'Meat',
      storage: 'freezer',
    ),
    // Add more sample items
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkExpiringItems();
  }

 void _checkExpiringItems() {
  final now = DateTime.now();
  for (var item in _items) {
    final difference = item.expiryDate.difference(now).inDays;
    if (difference <= 2 && difference >= 0) {
      // تأجيل عرض الـ SnackBar باستخدام addPostFrameCallback
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showExpiryNotification(item);
      });
    }
  }
}


  void _showExpiryNotification(FoodItem item) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.name} will expire in ${item.expiryDate.difference(DateTime.now()).inDays} days'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Waste'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.kitchen), text: 'Fridge'),
            Tab(icon: Icon(Icons.ac_unit), text: 'Freezer'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildStorageList('fridge'),
          _buildStorageList('freezer'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStorageList(String storage) {
    final filteredItems = _items.where((item) => item.storage == storage).toList()
      ..sort((a, b) => a.expiryDate.compareTo(b.expiryDate));

    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        final isExpired = item.expiryDate.isBefore(DateTime.now());
        final isExpiringSoon = item.expiryDate.difference(DateTime.now()).inDays <= 2;

        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isExpired 
                  ? Colors.red 
                  : isExpiringSoon 
                      ? Colors.orange 
                      : Colors.green,
              child: Icon(
                _getCategoryIcon(item.category),
                color: Colors.white,
              ),
            ),
            title: Text(
              item.name,
              style: TextStyle(
                color: isExpired ? Colors.red : null,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.category),
                Text(
                  'Expires: ${DateFormat('MMM dd, yyyy').format(item.expiryDate)}',
                  style: TextStyle(
                    color: isExpired ? Colors.red : isExpiringSoon ? Colors.orange : null,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _items.remove(item);
                });
              },
            ),
          ),
        );
      },
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'dairy':
        return Icons.emoji_food_beverage;
      case 'meat':
        return Icons.restaurant;
      case 'vegetables':
        return Icons.eco;
      case 'fruits':
        return Icons.apple;
      default:
        return Icons.food_bank;
    }
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String name = '';
        String category = 'Dairy';
        DateTime expiryDate = DateTime.now();
        String storage = 'fridge';

        return AlertDialog(
          title: const Text('Add New Item'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Item Name'),
                  onChanged: (value) => name = value,
                ),
                DropdownButtonFormField<String>(
                  value: category,
                  decoration: const InputDecoration(labelText: 'Category'),
                  items: ['Dairy', 'Meat', 'Vegetables', 'Fruits', 'Other']
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (value) => category = value!,
                ),
                DropdownButtonFormField<String>(
                  value: storage,
                  decoration: const InputDecoration(labelText: 'Storage'),
                  items: ['fridge', 'freezer']
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (value) => storage = value!,
                ),
                ListTile(
                  title: const Text('Expiry Date'),
                  subtitle: Text(DateFormat('MMM dd, yyyy').format(expiryDate)),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: expiryDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (picked != null) {
                      expiryDate = picked;
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty) {
                  setState(() {
                    _items.add(FoodItem(
                      name: name,
                      expiryDate: expiryDate,
                      category: category,
                      storage: storage,
                    ));
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}