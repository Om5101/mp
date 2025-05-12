import 'package:flutter/material.dart';
import 'product_list_screen.dart';

class CartScreen extends StatefulWidget {
  static List<Product> cartItems = [];

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double getTotalAmount() {
    return CartScreen.cartItems.fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: CartScreen.cartItems.isEmpty
          ? Center(child: Text("Your cart is empty !!!"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: CartScreen.cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              CartScreen.cartItems[index].image,
                              width: 60,
                              height: 60,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.image_not_supported,
                                    size: 60, color: Colors.grey);
                              },
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                CartScreen.cartItems[index].name,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              icon:
                              Icon(Icons.remove_circle, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  CartScreen.cartItems.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Price: ₹${CartScreen.cartItems[index].price.toStringAsFixed(2)}",
                          style:
                          TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Total: ₹${getTotalAmount().toStringAsFixed(2)}",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (CartScreen.cartItems.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Checkout successful!")),
                      );
                      setState(() {
                        CartScreen.cartItems.clear();
                      });
                    }
                  },
                  child: Text("Checkout"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
