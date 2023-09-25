import 'package:exam/view/screens/filmdetails.dart';
import 'package:exam/view/screens/filter.dart';
import 'package:exam/view/screens/homemovies.dart';
import 'package:exam/viewmodel/bloc/home/homecubit.dart';
import 'package:exam/viewmodel/services/network/diohelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //مهم ف اى ابلكيشن بعد كدا
  Diohelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => Homecubit()..getallmovies()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeMovies(),
            );
          },
        ));
  }
}
