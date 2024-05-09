import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/constant/urls.dart';
import '../bloc/detail_movie/detail_movie_bloc.dart';
import '../components/image_error.dart';
import '../components/image_loading.dart';

class DetailMoviePage extends StatefulWidget {
  const DetailMoviePage({super.key});

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          context.read<DetailMovieBloc>().state.state = StateDetailMovie.initial;
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.read<DetailMovieBloc>().state.data!.tittle),
        ),
        body: BlocBuilder<DetailMovieBloc, DetailMovieState>(
          builder: (context, state) {
            final stateDetail = state.state;
            final movie = state.data;

            if (stateDetail == StateDetailMovie.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (stateDetail == StateDetailMovie.failure) {
              return Center(
                  child: Text(state.message!,
                      style: const TextStyle(
                        color: Colors.white,
                      )));
            } else if (stateDetail == StateDetailMovie.loaded) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Stack(
                      children: [
                        ExtendedImage.network(
                          '${Urls.backdropPath}${movie!.backdrop}',
                          fit: BoxFit.contain,
                          cache: true,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          loadStateChanged: (stateImage) {
                            if (stateImage.extendedImageLoadState == LoadState.failed) {
                              return const ImageFailed(
                                aspectRatio: 16 / 9,
                                radius: 12,
                              );
                            } else if (stateImage.extendedImageLoadState == LoadState.loading) {
                              return const ImageLoading(
                                aspectRatio: 16 / 9,
                                radius: 12,
                              );
                            }

                            return ExtendedRawImage(
                              image: stateImage.extendedImageInfo!.image,
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.high,
                            );
                          },
                        ),
                        Positioned(
                          bottom: 20,
                          left: 30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 190,
                                width: 125,
                                child: ExtendedImage.network(
                                  '${Urls.basePoster}${movie.path}',
                                  fit: BoxFit.contain,
                                  cache: true,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(12),
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
                                    return ExtendedRawImage(
                                      image: stateImage.extendedImageInfo!.image,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    );
                                  },
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.8,
                                margin: const EdgeInsets.only(left: 12),
                                padding: const EdgeInsets.only(bottom: 3),
                                child: Text(
                                  movie.tittle,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 18,
                              color: Color(
                                0XFF92929D,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              DateFormat('d MMM yyyy').format(movie.release),
                              style: const TextStyle(
                                color: Color(
                                  0XFF92929D,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              '|',
                              style: TextStyle(
                                color: Color(
                                  0XFF92929D,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 5),
                        Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.access_time_rounded,
                              size: 18,
                              color: Color(
                                0XFF92929D,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              movie.runtime.toString(),
                              style: const TextStyle(
                                color: Color(
                                  0XFF92929D,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              'Menit',
                              style: TextStyle(
                                color: Color(
                                  0XFF92929D,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: movie.genres
                          .map((e) => Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: const Color(0XFF92929D),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                          .take(3)
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        movie.status,
                        style: const TextStyle(
                          color: Color(
                            0XFF92929D,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 5),
                          Text(
                            '${movie.voteAverage.toStringAsFixed(1)} (${movie.voteCount})',
                            style: const TextStyle(
                              color: Color(
                                0XFF92929D,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      movie.overview,
                      maxLines: 10,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
