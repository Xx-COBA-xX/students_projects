import 'package:another_pro/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const FlowerShopApp());
}

class FlowerShopApp extends StatelessWidget {
  const FlowerShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.poppins(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const AppBottomNav(),
    );
  }
}

class FlowerProduct {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> categories;

  FlowerProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categories,
  });
}

class FlowerShopHomePage extends StatefulWidget {
  const FlowerShopHomePage({super.key});

  @override
  FlowerShopHomePageState createState() => FlowerShopHomePageState();
}

class FlowerShopHomePageState extends State<FlowerShopHomePage> {
  final List<FlowerProduct> _products = [
    FlowerProduct(
      id: '1',
      name: 'Rose Bouquet',
      description: 'Classic red rose bouquet, perfect for romantic occasions ',
      price: 12.99,
      imageUrl:
          'https://img.freepik.com/free-photo/red-roses-bouquet-table_140725-828.jpg?uid=R63094493&semt=ais_hybrid',
      categories: ['Romantic', 'Best Sellers'],
    ),
    FlowerProduct(
      id: '2',
      name: 'Sunflower Delight',
      description: 'Bright and cheerful sunflower arrangement',
      price: 13.50,
      imageUrl:
          'https://img.freepik.com/free-photo/beautiful-sunflowers-outdoors-still-life_23-2150152811.jpg?uid=R63094493&semt=ais_hybrid',
      categories: ['Cheerful', 'Summer'],
    ),
    FlowerProduct(
      id: '3',
      name: 'Orchid Elegance',
      description: 'Exotic orchid arrangement in a modern ceramic pot',
      price: 8.00,
      imageUrl:
          'https://img.freepik.com/free-photo/modern-floral-composition-with-elegant-style_23-2147897563.jpg?uid=R63094493&semt=ais_hybrid',
      categories: ['Luxury', 'Indoor'],
    ),
    FlowerProduct(
      id: '4',
      name: 'Mixed Wildflower Bouquet',
      description: 'Colorful mix of seasonal wildflowers',
      price: 9.99,
      imageUrl:
          'https://img.freepik.com/free-photo/wedding-bouquet-lies-grass_1304-5585.jpg?uid=R63094493&semt=ais_hybrid',
      categories: ['Seasonal', 'Natural'],
    ),
    FlowerProduct(
      id: '1',
      name: 'Bouquet of St Johns herbs',
      description: 'Bouquet of St Johns herbs Colorful mix of seasonal wildflowers',
      price: 6.99,
      imageUrl:
          'https://img.freepik.com/premium-photo/bouquet-st-johns-herbs_110762-273.jpg?uid=R63094493&semt=ais_hybrid',
      categories: ['Seasonal', 'Natural'],
    ),
    FlowerProduct(
      id: '2',
      name: 'Allium field with Butterflies',
      description: 'Allium field with Butterflies Colorful mix of seasonal wildflowers',
      price: 10.99,
      imageUrl:
          'https://img.freepik.com/free-photo/allium-field-with-butterflies_1398-4556.jpg?t=st=1733774741~exp=1733778341~hmac=8cde8146c34ccab8899beab6ab05f55c4156437ccd4a394fb71f7b8905fe74a8&w=1800',
      categories: ['Seasonal', 'Natural'],
    ),
    FlowerProduct(
      id: '3',
      name: 'Beautiful arrangement of flowers for a birthday girl',
      description: 'Allium field with Butterflies Colorful mix of seasonal wildflowers',
      price: 14.99,
      imageUrl:
          'https://img.freepik.com/free-photo/beautiful-arrangement-flowers-birthday-girl_23-2149077362.jpg?t=st=1733774832~exp=1733778432~hmac=9e606d550548d2abe75f3651eef6df89c20d8de175318572cc8b88183a77012c&w=740',
      categories: ['Seasonal', 'Natural'],
    ),
    FlowerProduct(
      id: '4',
      name: 'Stunning wedding bouquet made of red flowers and greenery lies o',
      description: 'Allium field with Butterflies Colorful mix of seasonal wildflowers',
      price: 21.99,
      imageUrl:
          'https://img.freepik.com/free-photo/stunning-wedding-bouquet-made-red-flowers-greenery-lies-o_8353-722.jpg?t=st=1733774893~exp=1733778493~hmac=251dc46eed49096d138731f53510f1e9895253d472bdc6fc78ba82add9c75fb9&w=740',
      categories: ['Seasonal', 'Natural'],
    ),
  ];

  List<String> categories = [
    'All',
    'Romantic',
    'Cheerful',
    'Luxury',
    'Seasonal'
  ];
  String _selectedCategory = 'All';
  List<FlowerProduct> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _products;
  }

  void _filterProducts(String category) {
    setState(() {
      _selectedCategory = category;
      _filteredProducts = category == 'All'
          ? _products
          : _products
              .where((product) => product.categories.contains(category))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloom & Grow',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.pink,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Selector
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: _selectedCategory == category,
                    onSelected: (_) => _filterProducts(category),
                    selectedColor: Colors.pink.shade100,
                    backgroundColor: Colors.grey.shade200,
                  ),
                );
              }).toList(),
            ),
          ),

          // Product Grid
          Expanded(
            child: AlternativeStaggeredGridView(products: _filteredProducts),
          ),
        ],
      ),
      
    );
  }
}

class AlternativeStaggeredGridView extends StatelessWidget {
  final List<FlowerProduct> products;

  const AlternativeStaggeredGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(context, products[index]);
      },
    );
  }

  Widget _buildProductCard(BuildContext context, FlowerProduct product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadowColor: Colors.black.withOpacity(0.1), // Subtle shadow for depth
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.grey))),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.grey),
                  fit: BoxFit.cover,
                 
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      product.name,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black87, // Neutral text color
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // Product Price
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.7), // Soft dark color
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatefulWidget {
  final FlowerProduct product;

  const ProductDetailPage({super.key, required this.product});

  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: widget.product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.product.description,
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.product.price.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: _decrementQuantity,
                            ),
                            Text(
                              '$_quantity',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: _incrementQuantity,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add to cart functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: const Center(
        child: Text('Cart is empty'),
      ),
    );
  }
}
