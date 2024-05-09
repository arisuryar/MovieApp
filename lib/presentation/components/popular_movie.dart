import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constant/urls.dart';
import '../bloc/detail_movie/detail_movie_bloc.dart';
import '../bloc/home/home_bloc.dart';
import '../pages/detail_movie_page.dart';
import 'image_error.dart';
import 'image_loading.dart';

class PopularMovie extends StatelessWidget {
  final HomeState state;
  final double height;
  const PopularMovie({super.key, required this.state, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: key,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12, top: 5, bottom: 5),
            child: Text(
              'Popular',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              key: const Key('popular_item'),
              scrollDirection: Axis.horizontal,
              itemCount: state.popular!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final popular = state.popular![index];
                return Padding(
                  padding: EdgeInsets.only(right: 10, left: index == 0 ? 10 : 0, bottom: 5),
                  child: AspectRatio(
                    aspectRatio: 12 / 16,
                    child: ExtendedImage.network(
                      '${Urls.basePoster}${popular.poster}',
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
                                popular.tittle,
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
                                  context.read<DetailMovieBloc>().add(OnGetDetailMovie(popular.id));

                                  Timer(const Duration(seconds: 1), () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailMoviePage()));
                                  });
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
