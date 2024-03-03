import 'package:e_com/bloc/ecom_bloc.dart';
import 'package:e_com/data/data_model.dart';
import 'package:e_com/presentation/screens/cart_screen.dart';
import 'package:e_com/presentation/screens/fav_screen.dart';
import 'package:e_com/presentation/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<EcomBloc>().add(Datafetched());
  }

  @override
  Widget build(BuildContext context) {
    const title = "AtoZone";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_checkout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<EcomBloc, EcomState>(
        builder: (context, state) {
          if (state is Error) {
            Future.delayed(const Duration(milliseconds: 500), () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.msg),
                  backgroundColor: Colors.red,
                ),
              );
            });
            return Center(
              child: Text(state.msg),
            );
          }

          if (state is DataSucess) {
            final List<ProductData> products = state.data;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                return card(
                  productName: products[index].productName,
                  productDescription: products[index].productDescription,
                  price: products[index].price,
                  iscart: products[index].iscart,
                  isfav: products[index].isfav,
                  imgurl: products[index].imgurl,
                  index: index,
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
