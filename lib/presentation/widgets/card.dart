// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_com/bloc/ecom_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class card extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double price;
  final bool iscart;
  final bool isfav;
  final String imgurl;
  final int index;

  const card({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.iscart,
    required this.isfav,
    required this.imgurl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _cartclicked(int inde) {
      print(inde);
      context.read<EcomBloc>().add(AddCartEvent(index: inde));
    }

    void _favClicked(int inde) {
      print(inde);
      context.read<EcomBloc>().add(AddfavEvent(index: inde));
    }

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 300,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                imgurl,
              ),
            ),
          ),
        ),
        Text(
          productName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        Text(
          productDescription,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            '\$ $price',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  _favClicked(index);
                },
                icon: isfav
                    ? Icon((Icons.favorite))
                    : Icon(Icons.favorite_outline),
                iconSize: 22,
              ),
              IconButton(
                onPressed: () {
                  _cartclicked(index);
                },
                icon: iscart
                    ? Icon(Icons.shopping_cart)
                    : Icon(Icons.shopping_bag_outlined),
                iconSize: 22,
              )
            ],
          ),
        ]),
      ]),
    );
  }
}
