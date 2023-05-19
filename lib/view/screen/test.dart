import 'package:flutter/material.dart';
import 'package:woocommerce_app/data/datasource/static/APIs/woocommere_api.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    Woocommerce_r con = Woocommerce_r();
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: FutureBuilder(
        future: con.getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // Create a list of products
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child:
                        Image.network(snapshot.data[index]["images"][0]["src"]),
                  ),
                  title: Text(snapshot.data[index]["name"]),
                  subtitle:
                      Text("Buy now for \$ " + snapshot.data[index]["price"]),
                );
              },
            );
          }

          // Show a circular progress indicator while loading products
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
