import 'package:exam/view/component/homemovieswidget.dart';
import 'package:exam/view/screens/filmdetails.dart';
import 'package:exam/view/screens/filter.dart';
import 'package:exam/viewmodel/bloc/home/homecubit.dart';
import 'package:exam/viewmodel/bloc/home/homestate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../viewmodel/services/navigation.dart';

class HomeMovies extends StatelessWidget {
  const HomeMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<Homecubit, Homestate>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var Cubit = Homecubit.get(context);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text('movies cubit',
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white)),
                          trailing: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 300.w,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Color.fromARGB(255, 48, 43, 43)),
                              child: Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: Text(
                                  'Search',
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                                width: 35.w,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80.r),
                                    color: Color.fromARGB(255, 48, 43, 43)),
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        Navigatioon.gopush(context, Filter());
                                      },
                                      icon: Icon(
                                        Icons.filter_alt,
                                        color: Colors.white,
                                      )),
                                ))
                          ],
                        ),
                        Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 134, 120, 120),
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: Expanded(
                            child: GridView.count(
                              childAspectRatio: 9 / 16,
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              children: List.generate(
                                  Cubit.moviesmodel?.results?.length ?? 0,
                                  (index) => HomeWidget(
                                        result:
                                            Cubit.moviesmodel?.results?[index],
                                      )),
                            ),
                          ),
                        )
                      ],
                    );
                  })),
        ));
  }
}
