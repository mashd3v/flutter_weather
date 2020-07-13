import 'package:clima_flutter/services/weather.dart';
import 'package:clima_flutter/utils/constants.dart';
import 'package:clima_flutter/pages/location_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
          Text(
            'Locating you',
            style: kButtonTextStyle,
          ),
        ],
      ),
    );
  }

  void getLocationData() async{
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context){
          return LocationPage(
            locationWeather: weatherData,
          );
        }
      )
    );
  }
      

}