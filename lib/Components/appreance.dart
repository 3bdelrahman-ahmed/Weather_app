import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/Components/weather.dart';
import 'package:test_1/cubit/weather_cubit.dart';
import 'package:intl/intl.dart';


class Appreance extends StatefulWidget{
  const Appreance({super.key});

  @override
  State<Appreance> createState() => AppreanceState();
}

class AppreanceState extends State<Appreance> {
         late String  x=" " ;
         late int idd=0;
         late double cont=0;
         late String day=" ";
         List<Image>pic=[
            Image.asset('assets/cover9.png',),
            Image.asset('assets/cover8.png',),
            Image.asset('assets/cover7.png',),
            Image.asset('assets/cover11.png',),
            Image.asset('assets/cover12.png',),
            Image.asset('assets/cover13.png',),
            Image.asset('assets/cover15.png',),
         ];
        DateTime currentDateTime = DateTime.now();
           @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          cont = 0.1;
        });
        _reverseAnimation();
      }
    });
  }

  void _reverseAnimation() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          cont = 0.8;
        });
        _startAnimation();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
             String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(currentDateTime);

    return  Container(
              margin:const EdgeInsets.only(left: 0),
              child: BlocBuilder<WeatherCubit,WeatherState>(builder: (context,state){
                if(state is WeatherInitial||state is LoadingState){
                   print(state);
                  return const CircularProgressIndicator();
                }
                else if(state is ResponseState){
                 return Column(
                   children: [
                     Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 12, right: 20, top: 65),
                      child: AnimatedOpacity(
                        curve: Curves.linear,
                        duration:const Duration(seconds: 7) ,
                        opacity: cont,
                        child: pic[idd],
                      ),
                    
                  ),
                   Align(
                        alignment: const Alignment(-0.7, 0.9),
                        child: Container(
                          margin: EdgeInsets.only(left: 30,right: 23),
                          child: Row(
                            children: [
                              Container(
                              //  margin: EdgeInsets.only(left: 20),
                                child: Text("${x}°",
                                style: GoogleFonts.albertSans(
                                  fontSize: 40,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ),
                              SizedBox(width: 125,),
                              Text(day,
                                style: GoogleFonts.albertSans(
                                  fontSize: 35,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, -0.4),
                        child: Column(
                          children: [
                            Text(state.list[idd].city,
                            style: GoogleFonts.aboreto(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                            ),
                             Text(state.list[idd].country,
                            style: GoogleFonts.aboreto(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                            ),
                          Text(formattedDateTime,
                            style: GoogleFonts.aboreto(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                            ),
                          ],
                        ),
                      )
                ],
              ),
            ),
                     Container(
                      height: MediaQuery.of(context).size.height*0.3,
                       child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                         child: Column(
                          children: [
                            for(Weather i in state.list)
                          GestureDetector(child: i,
                          onTap: () {
                                 setState(() {
                                idd=i.id;
                                day=i.day;
                      x=(((state.list[idd].htemp)+(state.list[idd].mtemp))/2).toStringAsFixed(2);
                                print(idd);
                                print(x);
                              });
                          },
                          ), 
                                            
                          ],
                         ),
                       ),
                     ),
                   ],
                 );
                        }
              else{
                return Text('');
              }
              
              }
                    
              ),
            );

  }
}