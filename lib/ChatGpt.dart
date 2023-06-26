import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  const Product({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  const ProductCard({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      title: 'Product 1',
      description: 'This is the description of product 1',
      price: 10.99,
      imageUrl: 'https://picsum.photos/200/300',
    ),
    Product(
      title: 'Product 2',
      description: 'This is the description of product 2',
      price: 20.99,
      imageUrl: 'https://picsum.photos/200/300',
    ),
    Product(
      title: 'Product 3',
      description: 'This is the description of product 3',
      price: 30.99,
      imageUrl: 'https://picsum.photos/200/300',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      itemCount: 3,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(
          title: products[index].title,
          description: products[index].description,
          price: products[index].price,
          imageUrl: products[index].imageUrl,
        );
      },
    ));
  }
}
