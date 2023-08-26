part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}
class LoadingState extends WeatherState{}
// ignore: must_be_immutable
class ResponseState extends WeatherState{
  List<Weather>list;
  ResponseState(this.list);
}
class ErorrState extends WeatherState{
  final String errorMessage ="fucked UP";
  ErorrState(errorMessage);
}
class DegreeState extends WeatherState{}
