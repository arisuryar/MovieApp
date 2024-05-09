import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constant/urls.dart';
import '../bloc/detail_movie/detail_movie_bloc.dart';
import '../bloc/search/search_bloc.dart';
import '../components/image_error.dart';
import '../components/image_loading.dart';
import 'detail_movie_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchC = TextEditingController();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.pop(context);
          context.read<SearchBloc>().state.state = StateSearch.initial;
          context.read<SearchBloc>().state.searchMovie?.clear();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cari Movie'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0XFF3A3F47),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchC,
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        if (value.isNotEmpty || value != '') {
                          context.read<SearchBloc>().add(OnGetSearchMovie(searchC.value.text));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text(
                                'Tidak boleh kosong',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 16, 16, 16),
                        hintStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                        hintText: 'Mau cari film apa?',
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search,
                    color: Color(0XFF67686D),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.state == StateSearch.loading) {
                  return const Expanded(child: Center(child: CircularProgressIndicator()));
                } else if (state.state == StateSearch.failure) {
                  return Expanded(
                      child: Center(
                          child: Text(
                    state.message!,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )));
                } else if (state.state == StateSearch.loaded) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: MediaQuery.of(context).size.height / 3,
                      ),
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      itemCount: state.searchMovie!.length,
                      itemBuilder: (context, index) {
                        final movie = state.searchMovie![index];
                        return AspectRatio(
                          aspectRatio: 12 / 16,
                          child: ExtendedImage.network(
                            '${Urls.basePoster}${movie.poster}',
                            fit: BoxFit.contain,
                            cache: true,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            loadStateChanged: (stateImage) {
                              if (stateImage.extendedImageLoadState == LoadState.failed) {
                                return const ImageFailed(
                                  aspectRatio: 12 / 16,
                                  radius: 5,
                                );
                              } else if (stateImage.extendedImageLoadState == LoadState.loading) {
                                return const ImageLoading(
                                  aspectRatio: 12 / 16,
                                  radius: 5,
                                );
                              }
                              return Stack(
                                fit: StackFit.expand,
                                children: [
                                  ExtendedRawImage(
                                    image: stateImage.extendedImageInfo!.image,
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.bottomLeft,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black87,
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                    child: Text(
                                      movie.tittle,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        context.read<DetailMovieBloc>().add(OnGetDetailMovie(movie.id));
                                        Timer(const Duration(seconds: 1), () {
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => const DetailMoviePage()));
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                }
                return const Expanded(
                  child: Center(
                    child: Text(
                      'Belum ada film yang di cari nih',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
