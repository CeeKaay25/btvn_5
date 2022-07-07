import 'package:flutter/material.dart';
import 'package:flutterdemo/product_detail.dart';

import 'product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          title: Text("My shop"),
          backgroundColor: const Color(0xFF9C27B0),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: ListProduct(),
      ),
    );
  }
}

final List<Product> listProduct = [
  Product(
      "Mũ Bucket",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbMQnPYFe8gTwH1iaW1i7KsxwWDZH7FOQNuBJE1JehIqBh9XTYxJ5dmTzmZ_xgGVcsNfE&usqp=CAU",
      "\$5.6",
      false),
  Product(
      "Áo Phông",
      "https://cf.shopee.vn/file/6aba1d32171c02c7e0c3d59a5f75fbb8",
      "\$9.8",
      false),
  Product(
      "Quần Jogger",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRofx1m8j-iRG9ElSraXD3-8EyKzojx-aSuhw&usqp=CAU",
      "\$5.4",
      false),
  Product(
      "Giày Sneaker",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAcQjudphqoXXc3tkcxhtvj8Ql1NNX-gat9KYRJaitVUlVdK2nJLHJoXpWLfqG5Vf1PkA&usqp=CAU",
      "\$7.5",
      false),
];

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        childAspectRatio: 3 / 2,
        crossAxisCount: 2,
        children: [
          for (int i = 0; i < listProduct.length; i++)
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => ProductDetail(listProduct[i])));
              }, // Handle your callback
              child: ProductItem(
                product: listProduct[i],
              ),
            )
        ]);
  }
}

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState(product);
}

class _ProductItemState extends State<ProductItem> {
  final Product product;

  _ProductItemState(this.product);

  @override
  Widget build(BuildContext context) {
    
    var screenSize = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              product.image,
              width: screenSize.width / 2.0 - 16,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            height: 40,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    product.favorite ? Icons.favorite : Icons.favorite_border,
                    color: Color(0xFF9F28B4),
                  ),
                  onPressed: () {
                    setState(() {
                      product.favorite = !product.favorite;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    product.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                  ),
                  //flex: 1,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Color(0xFF9F28B4),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
