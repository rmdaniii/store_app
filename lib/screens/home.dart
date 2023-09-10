import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/getAllProuducts.dart';

import 'card_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Products Trending',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 70),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProductsServices().getAllProducts(),
          builder: (context , snapshot){

            if(snapshot.hasData){

              List<ProductModel> products = snapshot.data!;

              return GridView.builder(
                itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing:10 ,
                      mainAxisSpacing: 80
                  ),
                  itemBuilder: (context, index){
                    return  CustomCard(product: products[index]);
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ) ,
      ),
    );
  }
}

