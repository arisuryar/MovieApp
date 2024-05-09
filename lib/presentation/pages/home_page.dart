import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constant/size.dart';
import '../bloc/home/home_bloc.dart';
import '../components/now_playing_movie.dart';
import '../components/popular_movie.dart';
import '../components/up_coming_movie.dart';
import 'profile_page.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('app_bar'),
        leading: IconButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              )),
          icon: const Icon(Icons.person),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage())),
              icon: const Icon(Icons.search)),
        ],
        title: const Text('Movie App'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final stateHome = state.state;
          if (stateHome == StateHome.loading) {
            return const Center(key: Key('loading'), child: CircularProgressIndicator());
          } else if (stateHome == StateHome.failure) {
            return Center(
                key: const Key('failure'),
                child: Text(state.message!,
                    style: const TextStyle(
                      color: Colors.white,
                    )));
          } else if (stateHome == StateHome.loaded) {
            return Column(
              key: const Key('loaded'),
              children: [
                NowPlayingMovie(
                  state: state,
                  height: AppSize().heightBody(context) / 2.7,
                ),
                PopularMovie(
                  state: state,
                  height: AppSize().heightBody(context) / 3.55,
                ),
                const SizedBox(height: 10),
                UpComingMovie(
                  state: state,
                  height: AppSize().heightBody(context) / 3.55,
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
