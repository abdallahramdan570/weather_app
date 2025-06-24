class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weatherCondition;

 

  WeatherModel(
      {required this.cityName,
      required this.date,
       required this.image,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherCondition});

  factory WeatherModel.formjason(jason) {
    return WeatherModel(
      cityName: jason['location']['name'],
      date: DateTime.parse(jason['current']['last_updated']),
      image: jason['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: jason['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: jason['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: jason['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: jason['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
