
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}
class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState{}

class WeatherFailure extends WeatherState{}
