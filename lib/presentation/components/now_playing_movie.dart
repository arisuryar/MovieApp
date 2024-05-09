import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/constant/urls.dart';
import '../bloc/detail_movie/detail_movie_bloc.dart';
import '../bloc/home/home_bloc.dart';
import '../pages/detail_movie_page.dart';
import 'image_error.dart';
import 'image_loading.dart';

class NowPlayingMovie extends StatelessWidget {
  final double height;
  final HomeState state;
  const NowPlayingMovie({super.key, required this.state, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: key,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12, top: 5),
            child: Text(
              'Now Playing',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                aspectRatio: 16 / 9,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
              ),
              items: List.generate(state.nowPlaying!.length, (index) {
                final nowPlaying = state.nowPlaying![index];
                return ExtendedImage.network(
                  '${Urls.backdropPath}${nowPlaying.backdrop}',
                  fit: BoxFit.contain,
                  cache: true,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
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

                    return Stack(
                      key: const Key('now_playing_image'),
                      fit: StackFit.expand,
                      children: [
                        ExtendedRawImage(
                          image: stateImage.extendedImageInfo!.image,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nowPlaying.tittle,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 18),
                                  Text(
                                    '${nowPlaying.voteAverage.toStringAsFixed(1)} (${nowPlaying.voteCount})',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Text(
                                DateFormat('MMM d, yyyy').format(nowPlaying.release),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              context.read<DetailMovieBloc>().add(OnGetDetailMovie(nowPlaying.id));

                              Timer(const Duration(seconds: 1), () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailMoviePage()));
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
