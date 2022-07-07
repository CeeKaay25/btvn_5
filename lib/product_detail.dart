import 'package:flutter/material.dart';

import 'product.dart';

class ProductDetail extends StatelessWidget {
  Product product;

  ProductDetail(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Image.network(
                product.image,
                height: 500,
                fit: BoxFit.fill,
              ),
              Positioned(
                  top: -30,
                  left: -30,
                  child: Container(
                    margin: const EdgeInsets.all(50),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF9F28B4)
                        )),
                  )),
              Positioned(
                  bottom: 24,
                  left: 24,
                  child: Text(
                    product.name,
                    style: const TextStyle(color: Color(0xFF9F28B4), fontSize: 20),
                  ))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            product.price,
            style: const TextStyle(color: Colors.black, fontSize: 50),
          )
        ],
      ),
    );
  }
}
