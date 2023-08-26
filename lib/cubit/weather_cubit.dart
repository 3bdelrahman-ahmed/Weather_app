// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_1/Components/weather.dart';

import '../api_call.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final DataFromApiCall data;
  WeatherCubit(this.data) : super(WeatherInitial());
  Future<void>DataApp() async{
    emit(LoadingState());
    try{
    final res= await data.Data();
   // print(res);
    emit(ResponseState(res));
  }catch(e){
    emit(ErorrState(e.toString()));
  }
  }
}
