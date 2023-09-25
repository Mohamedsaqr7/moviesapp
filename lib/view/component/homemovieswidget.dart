import 'package:exam/model/movie.dart';
import 'package:exam/view/screens/filmdetails.dart';
import 'package:exam/viewmodel/services/network/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../viewmodel/services/navigation.dart';

class HomeWidget extends StatelessWidget {
  Results? result;
  HomeWidget({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    double rating = result!.voteAverage! - 5;
    return Padding(
      padding: EdgeInsets.only(top: 15.h, left: 10.w),
      child: InkWell(
        onTap: () {
          Navigatioon.gopush(
              context,
              FilmDetaiils(
                result: result,
              ));
        },
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '$imagepath${result?.posterPath}',
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    unratedColor: Colors.white,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 4,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemSize: 22,
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '${result!.voteAverage}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Text(
                result?.originalTitle ?? '',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
