import 'dart:async';

import 'package:e_com/data/data_model.dart';
import 'package:e_com/data/repositry/data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ecom_event.dart';
part 'ecom_state.dart';

class EcomBloc extends Bloc<EcomEvent, EcomState> {
  final DataRepository dataRepository;

  EcomBloc(this.dataRepository) : super(EcomInitial()) {
    on<Datafetched>(_getdata);

    on<AddCartEvent>(_addtocart);

    on<AddfavEvent>(_addtofav);
  }

  void _getdata(event, emit) async {
    emit(Eloading());

    try {
      final datas = await dataRepository.getData();

      emit(DataSucess(data: datas));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void _addtocart(event, emit) async {
    try {
      final datas = await dataRepository.getData();

      datas[event.index].iscart = !(datas[event.index].iscart);

      emit(DataSucess(data: datas));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void _addtofav(event, emit) async {
    try {
      final datas = await dataRepository.getData();

      datas[event.index].isfav = !(datas[event.index].isfav);

      emit(DataSucess(data: datas));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
