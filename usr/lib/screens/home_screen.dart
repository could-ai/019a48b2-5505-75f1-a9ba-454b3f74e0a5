import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Product> products = [
    Product(
      id: '1',
      name: 'Classic T-Shirt',
      description: 'A classic t-shirt made from 100% cotton.',
      price: 29.99,
      imageUrl: 'https://i.pinimg.com/564x/01/42/1d/01421d2472f21466233480172341e4b4.jpg',
    ),
    Product(
      id: '2',
      name: 'Slim Fit Jeans',
      description: 'Comfortable and stylish slim fit jeans.',
      price: 89.99,
      imageUrl: 'https://i.pinimg.com/564x/e7/8e/33/e78e330ef90cf46124b4a42a7b3d3323.jpg',
    ),
    Product(
      id: '3',
      name: 'Hoodie',
      description: 'A warm and cozy hoodie for chilly days.',
      price: 59.99,
      imageUrl: 'https://i.pinimg.com/564x/a2/51/02/a25102a24a4a1a8946da23b82e444a30.jpg',
    ),
    Product(
      id: '4',
      name: 'Sneakers',
      description: 'Stylish sneakers for everyday wear.',
      price: 129.99,
      imageUrl: 'https://i.pinimg.com/564x/a5/1f/a7/a51fa7b3074653350aa18a7fdb155a0b.jpg',
    ),
     Product(
      id: '5',
      name: 'Summer Dress',
      description: 'A light and airy summer dress.',
      price: 49.99,
      imageUrl: 'https://i.pinimg.com/564x/93/d1/57/93d1573df4b6114151a63b2a2531a396.jpg',
    ),
    Product(
      id: '6',
      name: 'Leather Jacket',
      description: 'A classic leather jacket for a timeless look.',
      price: 199.99,
      imageUrl: 'https://i.pinimg.com/564x/0b/e3/37/0be337a63a65b40978a1d77415d8a8ee.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: products[i]),
              ),
            );
          },
          child: Card(
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    products[i].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    products[i].name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '\$${products[i].price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}