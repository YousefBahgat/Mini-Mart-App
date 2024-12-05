import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_shop_app/screens/splash_screen.dart';

import 'package:mini_shop_app/services/api_service.dart';

import 'cubits/cart_cubit.dart';
import 'cubits/product_cubit.dart';

import 'services/local_storage_service.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageService.init(); // Initialize Hive
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductCubit(ApiService())),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.ubuntuCondensedTextTheme(
            Theme.of(context).textTheme.apply(),
          ),
        ),
        title: 'Mini Shop App',
        home: const SplashPage(),
      ),
    );
  }
}
