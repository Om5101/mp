import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class Product {
  final String name;
  final String image;
  final double price;
  final String description;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Smart-TV",
      image: "assets/TV.jpg",
      price: 69999,
      description: "Experience the latest technology with this high-end smartphone. Equipped with a powerful camera, long-lasting battery life, and a sleek design, it is perfect for both work and entertainment.",
    ),
    Product(
      name: "Headphones",
      image: "assets/headphones.jpg",
      price: 19999,
      description: "Immerse yourself in high-quality sound with these noise-canceling wireless headphones. Featuring deep bass and a comfortable fit, they are ideal for music lovers and professionals alike.",
    ),
    Product(
      name: "Laptop",
      image: "assets/laptop.jpg",
      price: 109999,
      description: "Boost your productivity with this powerful laptop. Designed for high performance, it comes with a sleek build, fast processing speeds, and an immersive display for a seamless user experience.",
    ),
    Product(
      name: "Smartwatch",
      image: "assets/smartwatch.jpg",
      price: 24999,
      description: "Stay connected and track your fitness with this stylish smartwatch. It features real-time notifications, activity tracking, and a durable build for everyday use.",
    ),
    Product(
      name: "Camera",
      image: "assets/camera.jpg",
      price: 49999,
      description: "Capture every moment with this professional DSLR camera. Designed for photography enthusiasts, it offers high-resolution images, advanced features, and superior performance in any lighting condition.",
    ),
    Product(
      name: "Tablet",
      image: "assets/tablet.jpg",
      price: 39999,
      description: "Experience seamless browsing and productivity with this high-performance tablet. Featuring a vibrant display, long battery life, and powerful processing, it is perfect for work and entertainment.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Browse Products")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8, // Adjusts height of the grid item
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(product: product),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        '₹${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
