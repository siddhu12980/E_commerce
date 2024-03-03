part of 'cart_bloc.dart';

sealed class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartFetch extends CartState {
  final List<ProductData> data;

  CartFetch({required this.data});
}

class ErrorState extends CartState {
  final String s;

  // ignore: non_constant_identifier_names
  ErrorState({required this.s});
}
