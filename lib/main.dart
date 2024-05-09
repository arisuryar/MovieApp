import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart';
import 'presentation/bloc/detail_movie/detail_movie_bloc.dart';
import 'presentation/bloc/home/home_bloc.dart';
import 'presentation/bloc/search/search_bloc.dart';
import 'presentation/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injection().init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<HomeBloc>()),
        BlocProvider(create: (context) => locator<SearchBloc>()),
        BlocProvider(create: (context) => locator<DetailMovieBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: const Color(0XFF242A32),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            color: Color(0xFF242A32),
            centerTitle: true,
          ),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
