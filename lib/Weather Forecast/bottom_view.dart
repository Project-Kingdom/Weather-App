import 'package:flutter/material.dart';
import 'Weather_Forecast_Model.dart';
import 'foecast_cad.dart';
Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot,BuildContext context){
  var forecastList=snapshot.data.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
         Padding(
           padding: const EdgeInsets.only(top:12.0),
           child: Text("7-Day Weather Forecast".toUpperCase(),style: TextStyle(
             fontSize: 14,
             fontWeight: FontWeight.bold,
             color: Colors.blueGrey,
           ),),
         ),
      Container(
        height: 300,
        padding: EdgeInsets.symmetric(vertical: 70,horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            separatorBuilder:(context,index) => SizedBox(width: 8,height: 12,),
            itemCount: forecastList.length,
          itemBuilder: (context,index)=>ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 300,
              height: 200,
              child: forecastCard(snapshot,index),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xff9661C3),Colors.green],
                begin:Alignment.topLeft,end: Alignment.bottomRight
              ),),
            ),
          ),
        ),
      )
    ],
  );
}