import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandSKUSize extends StatelessWidget {
  final String stock;

   BrandSKUSize({Key? key, required this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: EdgeInsets.only(left: 10),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Availability'
                          ,style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.bold)),
                        TextSpan(
                    text: ':instock(${stock.toString()})',
                        style: const TextStyle(color: Colors.black54))
                  ])),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: 'Brand:  ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Not Found', style: TextStyle(color: Colors.blue))
                    ])),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
