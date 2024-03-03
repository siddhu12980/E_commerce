part of 'ecom_bloc.dart';

sealed class EcomEvent {}

class Datafetched extends EcomEvent {}

//cart event - change icon add to cart page
class AddCartEvent extends EcomEvent {
  final int index;

  AddCartEvent({required this.index});
}

//fav event-- change icon change to fav event

class AddfavEvent extends EcomEvent {
  final int index;

  AddfavEvent({required this.index});
}

class CartpageRedirect extends EcomEvent {}

class FavCartpageRedirect extends EcomEvent {}
