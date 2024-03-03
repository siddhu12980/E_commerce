part of 'ecom_bloc.dart';

sealed class EcomState {}

class EcomInitial extends EcomState {}

class DataSucess extends EcomState {
  final List<ProductData> data;

  DataSucess({required this.data});
}

class Eloading extends EcomState {}

class Error extends EcomState {
  // ignore: prefer_typing_uninitialized_variables
  final msg;

  Error(this.msg);
}

class CartPage extends EcomState {
  final List<ProductData> data;

  CartPage({required this.data});
}

class FavPage extends EcomState {
  final List<ProductData> data;

  FavPage({required this.data});
}
