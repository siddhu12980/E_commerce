import 'package:e_com/auth/auth_methods.dart';
import 'package:e_com/data/models/user_model.dart';
import 'package:e_com/data/repositry/data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'User_bloc_event.dart';
part 'User_bloc_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final DataRepository dataRepository; // Add type annotation for dataRepository

  UserBloc(this.dataRepository) : super(UserInitial()) {
    on<UserData>(_dothis);
  }

  //notify the changes to list erners
}

// void _dothis(emit,state){
//     User? user;
//   final AuthMethods _authMethods = AuthMethods();
//   User get getUser => user!;

//   Future<void> refreshUser() async {
//     User userr = await _authMethods.getUserDetails();

//     user = userr;

//   }
void _dothis(event, emit) {}
