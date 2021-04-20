import 'package:flutter/material.dart';

import 'package:http/http.dart';

import 'Weather_Forecast_Model.dart';
import 'bottom_view.dart';
import 'mid_view.dart';
import 'network.dart';
class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel>forecastObject;
  String Cityname="Noida";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject =getweather(cityName: Cityname);
    // forecastObject.then((weather){
    //   print(weather.list[0].weather[0].main);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purpleAccent,
      body: SafeArea(
        bottom: true,
        child: ListView(
          children:<Widget> [
            textFeildView(),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.yellow,Colors.green],
                    begin:Alignment.topLeft,end: Alignment.bottomRight
                ),),
              child: FutureBuilder<WeatherForecastModel>(
                  future: forecastObject,
                  builder:(BuildContext context,AsyncSnapshot<WeatherForecastModel>snapshot){
                    if(snapshot.hasData){
                      return Column(
                        children:<Widget> [
                          midView(snapshot),
                          bottomView(snapshot, context),
                        ],
                      );
                    }else{
                      return Container(
                        child: Center(child:CircularProgressIndicator(),),
                      );
                    }
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

 Widget textFeildView() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.yellow,Colors.green],
            begin:Alignment.topLeft,end: Alignment.bottomRight
        ),),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name",
            fillColor: Colors.blueGrey,
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
              contentPadding: EdgeInsets.all(8),

          ),
          onSubmitted: (value){
            setState(() {
              Cityname=value;
              forecastObject=getweather(cityName:Cityname);
            });
          },
        ),
      ),
    );
  }

 Future<WeatherForecastModel> getweather({String cityName}) => new Network().getWeatherForecast(cityName: Cityname);
}
