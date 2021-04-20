import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Weather_Forecast_Model.dart';
import 'convert_icon.dart';
import 'util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel>snapshot){
  var forecastList=snapshot.data.list;
  var country = snapshot.data.city.country;
  var city = snapshot.data.city.name;
  var formattedDate=new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
  Container midView=Container(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$city,$country",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.blueGrey,
          ),),
          Text("${Util.getFormattedDate(formattedDate)}",style: TextStyle(
            fontSize: 15,color: Colors.blueGrey
          ),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(weatherDescription: forecastList[0].weather[0].main,color: Colors.blueGrey,size: 198),
          ),
          //Icon(FontAwesomeIcons.cloud,size:198,color: Colors.pinkAccent,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:12.0,horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${forecastList[0].temp.day.toStringAsFixed(0)}°F",style: TextStyle(
                  fontSize: 30,color: Colors.blueGrey
                ),),
                Text("${forecastList[0].weather[0].description.toUpperCase()}",style: TextStyle(color: Colors.blueGrey),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastList[0].speed.toStringAsFixed(1)} mi/h",style: TextStyle(color: Colors.blueGrey),),
                      Icon(FontAwesomeIcons.wind,size: 20,color: Colors.green,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("${forecastList[0].humidity.toStringAsFixed(0)} %",style: TextStyle(color: Colors.blueGrey),),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20,color: Colors.green,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("${forecastList[0].temp.max.toStringAsFixed(0)}°F",style: TextStyle(color: Colors.blueGrey),),
                      Icon(FontAwesomeIcons.temperatureHigh,size: 20,color: Colors.green,)
                      //Icon(Icons.wb_sunny_outlined,size: 20,color: Colors.brown,),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
  return midView;
}