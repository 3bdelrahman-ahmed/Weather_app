import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_1/Components/weather.dart';

class DataFromApiCall{
  List<String >days=["SAT","SUN","MON","TUE","WEN","THU","FRI"];
    Future<List<Weather>> Data() async{
    const  url = "https://pro.openweathermap.org/data/2.5/forecast/climate?lat=35&lon=139&appid=b4dc6fe9b60e255658456fe3d5620d23";
    final uri =Uri.parse(url);
    final respone = await http.get(uri);
    print(respone.statusCode);
    if(respone.statusCode==200)
    {
      Map<String, dynamic> jsonData = jsonDecode(respone.body);
 List<Map<String, dynamic>> dailyWeatherList = jsonData['list'].cast<Map<String, dynamic>>();

  List<Weather> temperatureDataList = [];
 Map<String ,dynamic> tempCity=jsonData['city'];
     String country=tempCity['country'];
     print(country);
  String cityName=tempCity['name'];
  for (int i = 0; i < 7; i++) {
    Map<String, dynamic> dayData = dailyWeatherList[i];
    Map<String, dynamic> tempData = dayData['temp'];
   

    double maxTemp = tempData['max'];
    double minTemp = tempData['min'];
   

    temperatureDataList.add(Weather(day:days[i], htemp: maxTemp-273.15, mtemp: minTemp-273.15,id: i,city: cityName,country: country,));
   
  }
  return temperatureDataList.toList();
    }
    else{
      throw "some thing went wrong ${respone.statusCode}";
    }
  }
}