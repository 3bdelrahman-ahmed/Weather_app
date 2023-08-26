import 'package:flutter/material.dart';
import 'package:test_1/Screens/first_screen.dart';
import 'package:test_1/api_call.dart';
import 'package:test_1/cubit/weather_cubit.dart';
import '''
package:flutter_bloc/flutter_bloc.dart''' show BlocProvider;
class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => WeatherCubit(DataFromApiCall()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}
