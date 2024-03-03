import 'package:e_com/bloc/cart_blloc.dart/cart_bloc.dart';
import 'package:e_com/bloc/ecom_bloc.dart';
import 'package:e_com/data/data_model.dart';
import 'package:e_com/presentation/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(DataCallfav());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fav Page"),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial) {
            // Initial state, show loading indicator or empty message
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartFetch) {
            // Cart data loaded, display the products in the cart
            return _buildCartList(state.data);
          } else if (state is ErrorState) {
            // Error state, display error message
            final errorstate = state;
            return Center(child: Text(errorstate.s));
          } else {
            // Unexpected state
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}

Widget _buildCartList(List<ProductData> cartData) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: cartData.length,
    itemBuilder: (BuildContext context, int index) {
      return card(
        productName: cartData[index].productName,
        productDescription: cartData[index].productDescription,
        price: cartData[index].price,
        iscart: cartData[index].iscart,
        isfav: cartData[index].isfav,
        imgurl: cartData[index].imgurl,
        index: index,
      );
    },
  );
}
