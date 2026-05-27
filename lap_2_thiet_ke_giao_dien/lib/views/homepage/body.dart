import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 1; i <= 5; i++)
          buildProductItem(),
      ],
    );
  }
}

Widget buildProductItem() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Product Image
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Image.asset(
                    "assets/images/avatar.png",
                    fit: BoxFit.fill,
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      height: 40,
                      child: FloatingActionButton.extended(
                        onPressed: () {},
                        label: const Text(
                          "Add new cart",
                          style: TextStyle(fontSize: 12),
                        ),
                        icon: const Icon(
                          Icons.shopping_cart,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Product name, price, like
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Name: Tea cup dog"),
                  Text("Price: 450\$"),
                ],
              ),

              const Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 5),
                  Text("41"),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          // List Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 1; i <= 5; i++)
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
            ],
          ),

          const SizedBox(height: 20),

          // Product Description
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Theo ghi nhận của phóng viên Dân trí, dự án được xây dựng trên một khu đất với nhiều hộ dân sinh sống bên trong.",
            ),
          ),
        ],
      ),
    ),
  );
}