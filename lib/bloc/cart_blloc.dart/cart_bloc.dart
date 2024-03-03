import 'dart:async';

import 'package:e_com/data/data_model.dart';
import 'package:e_com/data/repositry/data_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final DataRepository dataRepository; // Add type annotation for dataRepository

  CartBloc(this.dataRepository) : super(CartInitial()) {
    on<DataCall>(_fetchData);
    on<DataCallfav>(_fetchfav);
  }

  void _fetchData(event, emit) async {
    emit(CartLoading());
    try {
      final datas = await dataRepository.getData(filterCart: true);
      emit(CartFetch(data: datas));
    } catch (e) {
      emit(ErrorState(s: e.toString()));
    }
  }

  void _fetchfav(event, emit) async {
    emit(CartLoading());
    try {
      final datas = await dataRepository.getData(filterFavorites: true);
      emit(CartFetch(data: datas));
    } catch (e) {
      emit(ErrorState(s: e.toString()));
    }
  }
}
