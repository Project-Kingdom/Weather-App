import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Weather_Forecast_Model.dart';
import 'convert_icon.dart';
import 'util.dart';
Widget forecastCard(AsyncSnapshot<WeatherForecastModel>snapshot,int index){
var forecastList=snapshot.data.list;
var dayOfweek="";
DateTime date= new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
var fullDate=Util.getFormattedDate(date);
dayOfweek=fullDate.split(",")[0];
return Center(
  child:   Column(
    //
    // mainAxisAlignment: MainAxisAlignment.start,
    //
    // crossAxisAlignment: CrossAxisAlignment.start,

    children: [

    Center(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(width: 130,),
          Text(dayOfweek),
        ],
      ),
    )),

    Center(

      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          Padding(

            padding: const EdgeInsets.all(8.0),

            child: CircleAvatar(

              radius: 33,

              foregroundColor: Colors.black,

              child: getWeatherIcon(weatherDescription: forecastList[index].weather[0].main,

              color: Colors.blueGrey,size: 45),

            ),

          ),

          Center(

            child: Column(

              children: [

                Row(

                  children: [
                    SizedBox(width: 40,),
                    Text("${forecastList[index].temp.min.toStringAsFixed(0)}°F"),

                    Padding(

                      padding: const EdgeInsets.all(4.0),

                      child: Icon(FontAwesomeIcons.solidArrowAltCircleDown,color: Colors.white,size: 17),

                    ),

                  ],

                ),

                Row(

                  children: [
                    SizedBox(width: 40,),
                    Text("${forecastList[index].temp.max.toStringAsFixed(0)}°F"),

                    Padding(

                      padding: const EdgeInsets.all(4.0),

                      child: Icon(FontAwesomeIcons.solidArrowAltCircleUp,color: Colors.white,size: 17,),

                    ),

                  ],

                ),

                Row(

                   children: [
                     SizedBox(width: 40,),
                   Text("Hum : ${forecastList[index].humidity}%",),

                    //Icon(FontAwesomeIcons.solidGrinBeamSweat,color: Colors.white,size: 17,),

                  ],

                ),

                Row(

                  children: [
                    SizedBox(width: 40,),
                    Text("Wind : ${forecastList[index].speed.toStringAsFixed(1)} mp/h",),

                    //Icon(FontAwesomeIcons.solidGrinBeamSweat,color: Colors.white,size: 17,),

                  ],

                ),

              ],

            ),

          ),

        ],

      ),

    )

    ],

  ),
);
}