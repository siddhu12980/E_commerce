import 'package:e_com/bloc/cart_blloc.dart/cart_bloc.dart';
import 'package:e_com/bloc/ecom_bloc.dart';
import 'package:e_com/data/data_provider/data_provider.dart';
import 'package:e_com/data/repositry/data_repo.dart';
import 'package:e_com/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataRepository(
        ProductDataProvider(),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<EcomBloc>(
            create: (context) => EcomBloc(context.read<DataRepository>()),
          ),
          BlocProvider<CartBloc>(
            create: (context) => CartBloc(context.read<DataRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(),
        ),
      ),
    );
  }
}
