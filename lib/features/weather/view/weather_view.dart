import 'package:bloc_weather_app/features/weather/service/WeatherService.dart';
import 'package:bloc_weather_app/features/weather/viewmodel/weather_viewmodel.dart';
import 'package:bloc_weather_app/product/enum/LocationEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherView extends StatelessWidget {
  WeatherView({Key? key}) : super(key: key);

  final weatherService = WeatherService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherCubit(weatherService: weatherService),
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: _builAppBar(),
              body: _builMainContainer(context, state),
            );
          },
        ));
  }

  AppBar _builAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.redAccent,
      title: Text("Weather Bloc"),
    );
  }

  Container _builMainContainer(BuildContext context, WeatherState state) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (state is WeatherComplete) ...[
            _weatherItemCard(state)
          ] else if (state is WeatherLoading) ...[
            _circularProgressWidget(state)
          ],
          _weatherButtonRow(context)
        ],
      ),
    );
  }

  Card _weatherItemCard(WeatherComplete state) {
    return Card(
      child: ListTile(
        title: Text((state.weather?.location?.country) ?? "-"),
        subtitle: Text(state.weather?.location?.name ?? "-"),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(state.weather?.current?.tempC.toString() ?? "-"),
            Text(" \u2103"),
          ],
        ),
        trailing: Text(state.weather?.location?.localtime ?? "-"),
      ),
    );
  }

  Visibility _circularProgressWidget(WeatherLoading state) {
    return Visibility(
      visible: state.isLoading,
      child: Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.amber,
        color: Colors.grey.shade400,
      )),
    );
  }

  Row _weatherButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _atinaWeatherButton(context),
        _parisWeatherButton(context),
        _nairobiWeatherButton(context),
      ],
    );
  }

  ElevatedButton _atinaWeatherButton(BuildContext context) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
      onPressed: () {
        context
            .read<WeatherCubit>()
            .fetchWeatherData(locationName: LocationName.ATINA);
      },
      child: Text(
        "Atina",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  ElevatedButton _parisWeatherButton(BuildContext context) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
      onPressed: () {
        context
            .read<WeatherCubit>()
            .fetchWeatherData(locationName: LocationName.PARIS);
      },
      child: Text(
        "Paris",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  ElevatedButton _nairobiWeatherButton(BuildContext context) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
      onPressed: () {
        context
            .read<WeatherCubit>()
            .fetchWeatherData(locationName: LocationName.NAIROBI);
      },
      child: Text(
        "Nairobi",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
