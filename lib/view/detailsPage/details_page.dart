import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  var product;

   DetailsPage({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("detailsPage"),
      ),
    );
  }
}
