import 'package:flutter/material.dart';

class Weather extends StatelessWidget{
  final double htemp;
  final double mtemp;
  final String day;
  final int id;
  final String city;
  final String country;
  const Weather({super.key, required this.htemp, required this.mtemp, required this.day, required this.id, required this.city, required this.country});
  @override
  Widget build(BuildContext context) {
    List<Color>colors=[
      Colors.amber,
      Colors.black,
      Colors.amber,
      Colors.black,
      Colors.amber,
      Colors.black,
      Colors.amber,
    ];
    // TODO: implement build
    return  Container(
      width: MediaQuery.of(context).size.width*0.8,
     // height: MediaQuery.of(context).size.height*0.09,
     decoration: BoxDecoration(
            color:colors[id],
      borderRadius: BorderRadius.horizontal(left: Radius.circular(30),right: Radius.circular(30))
     ),
            child: Row(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2),
                child: Text(day,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      ),
              ),
            ],
          ),
        const  SizedBox(width: 50,),
          Column(
            children: [
                        Container(
                        child: Image(image:const AssetImage('assets/raincloudd.png'),
                        width: MediaQuery.of(context).size.width*0.3,
                        ),
                      ),
            ],
          )
        ],
      ),
    );

  }
}