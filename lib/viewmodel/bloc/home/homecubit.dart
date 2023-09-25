import 'dart:developer';

import 'package:exam/model/movie.dart';
import 'package:exam/viewmodel/services/network/diohelper.dart';
import 'package:exam/viewmodel/services/network/endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homestate.dart';

class Homecubit extends Cubit<Homestate> {
  Homecubit() : super(Homeinitstate());
  static Homecubit get(context) => BlocProvider.of<Homecubit>(context);

  Movie? moviesmodel;
  Future<void> getallmovies() async {
    emit(Homeloadingstate());
    await Diohelper.get(endpoints: '$movie/$popular').then((value) {
      print("dattttttttta ${value?.data.toString()}");
      moviesmodel = Movie.fromJson(value?.data);
      emit(Homesuccessstate());
    }).catchError((onError) {
      log("errorrrrrrrr :${onError}");
      emit(Homeerrorstate());
    });
  }
}
