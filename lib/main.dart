import 'package:e_com/bloc/cart_blloc.dart/cart_bloc.dart';
import 'package:e_com/bloc/ecom_bloc.dart';
import 'package:e_com/bloc/user_bloc/User_bloc.dart';
import 'package:e_com/data/data_provider/data_provider.dart';
import 'package:e_com/data/repositry/data_repo.dart';
import 'package:e_com/firebase_options.dart';
import 'package:e_com/presentation/screens/home.dart';
import 'package:e_com/presentation/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(context.read<DataRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const MyHomePage();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.hasError}'),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }
              }

              return const LoginScreen();
            },
          ),
        ),
      ),
    );
  }
}
