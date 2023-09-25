import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/movie.dart';
import '../../viewmodel/bloc/home/homecubit.dart';
import '../../viewmodel/bloc/home/homestate.dart';
import '../../viewmodel/services/navigation.dart';
import '../../viewmodel/services/network/endpoints.dart';

class FilmDetaiils extends StatelessWidget {
  Results? result;

  FilmDetaiils({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    double rating = result!.voteAverage! - 5;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: BlocConsumer<Homecubit, Homestate>(
              listener: (context, state) {},
              builder: (context, state) {
                var Cubit = Homecubit.get(context);
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Expanded(
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              '$imagepath${result?.posterPath}',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0.w),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                        )
                      ]),
                      SizedBox(
                        height: 18.h,
                      ),
                      Text(
                        result?.originalTitle ??
                            'black panther: wakanda forever',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            initialRating: rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            unratedColor: Colors.white,
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
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text('Description'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        result?.overview ??
                            'datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}

//$baseUrl/movie/$id/recommendations?api_key=$apiKey