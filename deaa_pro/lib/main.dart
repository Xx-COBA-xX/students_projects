import 'package:deaa_pro/bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
// ignore: depend_on_referenced_packages

void main() {
  runApp(const SustainabilityApp());
}

class SustainabilityApp extends StatelessWidget {
  const SustainabilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.rtl,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BottomNav(),
    );
  }
}

class SustainabilityHomePage extends StatefulWidget {
  const SustainabilityHomePage({super.key});

  @override
  SustainabilityHomePageState createState() => SustainabilityHomePageState();
}

class SustainabilityHomePageState extends State<SustainabilityHomePage> {
  final TextEditingController _searchController = TextEditingController();
  final List<RecyclingItem> _recyclingItems = [
    RecyclingItem(
      name: 'زجاجات بلاستيكية',
      icon: 'assets/images/water.png',
      tips: [
        'اشطف الزجاجات قبل إعادة التدوير',
        'قم بإزالة الأغطية وأعد تدويرها بشكل منفصل',
        'افعل الزجاجات لتوفير المساحة في حاوية التدوير',
        'استخدمها لعمل أواني زهور أو مشاريع حِرفية'
      ],
      color: Colors.blue.shade200,
    ),
    RecyclingItem(
      name: 'ورق',
      icon: 'assets/images/paper.png',
      tips: [
        'قم بتقطيع المستندات الحساسة قبل التدوير',
        'أزل النوافذ البلاستيكية من الأظرف',
        'احتفظ بالورق نظيفًا وجافًا',
        'استخدم الجانبين من الورق قبل التدوير'
      ],
      color: Colors.green.shade200,
    ),
    RecyclingItem(
      name: 'علب الألمنيوم',
      icon: 'assets/images/mo.png',
      tips: [
        'اشطف العلب جيدًا',
        'أزل الملصقات إذا كان ذلك ممكنًا',
        'افعل العلب لتوفير المساحة',
        'جمعها واذهب بها إلى مركز التدوير المحلي'
      ],
      color: Colors.grey.shade300,
    ),
    RecyclingItem(
      name: 'زجاجات زجاجية',
      icon: 'assets/images/gues.png',
      tips: [
        'نظف الزجاجات تمامًا',
        'أزل الأغطية المعدنية',
        'افصل حسب اللون إذا كان ذلك ممكنًا',
        'تعامل معها بعناية لتجنب الكسر'
      ],
      color: Colors.teal.shade100,
    ),
  ];

  List<RecyclingItem> _searchResults = [];

  void _searchRecyclingItems(String query) {
    setState(() {
      _searchResults = _recyclingItems
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'إعادة التدوير البيئي',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green.shade700,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // شريط البحث
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                onChanged: _searchRecyclingItems,
                decoration: InputDecoration(
                  hintText: 'ابحث عن مواد قابلة لإعادة التدوير...',
                  prefixIcon: Icon(Icons.search, color: Colors.green.shade700),
                  filled: true,
                  fillColor: Colors.green.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // المحتوى الرئيسي
            Expanded(
              child: _searchResults.isEmpty && _searchController.text.isNotEmpty
                  ? _buildNoResultsWidget()
                  : _buildRecyclingGrid(_searchResults.isEmpty
                      ? _recyclingItems
                      : _searchResults),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecyclingGrid(List<RecyclingItem> items) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildRecyclingItemCard(items[index]);
      },
    );
  }

  Widget _buildRecyclingItemCard(RecyclingItem item) {
    return GestureDetector(
      onTap: () => _showRecyclingDetails(item),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: item.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              item.icon,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 10),
            Text(
              item.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoResultsWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.do_not_disturb_alt_rounded,
              size: 100, color: Colors.green.shade500),
          const SizedBox(height: 20),
          Text(
            'لا توجد نصائح لإعادة التدوير',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green.shade700,
            ),
          ),
        ],
      ),
    );
  }

  void _showRecyclingDetails(RecyclingItem item) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: item.color.withOpacity(0.9),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'نصائح إعادة التدوير لـ ${item.name}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              ...item.tips.map((tip) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green.shade800),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            tip,
                            style: const TextStyle(),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}

class RecyclingItem {
  final String name;
  final String icon;
  final List<String> tips;
  final Color color;

  RecyclingItem({
    required this.name,
    required this.icon,
    required this.tips,
    required this.color,
  });
}
