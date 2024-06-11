import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/animation.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/constrains/image_selection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(4, -0.3),
              child: Container(
                height: 280,
                width: 280,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-4, -0.3),
              child: Container(
                height: 280,
                width: 280,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.deepPurple),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, -1.2),
              child: Container(
                height: 300,
                width: 600,
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ),
            BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
              builder: (context, state) {
                if (state is WeatherBlocSuccess) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '📍 ${state.weather.areaName}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const Text(
                          'Good Morning',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AnimatedGrowShrinkContainer(
                            child: getWeatherIcon(
                                state.weather.weatherConditionCode!)),
                        Center(
                          child: Text(
                            '${state.weather.temperature!.celsius!.round()}°C',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 55,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            state.weather.weatherMain!.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            DateFormat('EEEE dd .')
                                .add_jm()
                                .format(state.weather.date!),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/11.png',
                                  scale: 8,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sunrise',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      DateFormat()
                                          .add_jm()
                                          .format(state.weather.sunrise!),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/12.png',
                                  scale: 8,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sunset',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      DateFormat()
                                          .add_jm()
                                          .format(state.weather.sunset!),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/13.png',
                                  scale: 8,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Teamp Max',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${state.weather.tempMax!.celsius!.round()} °C",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/14.png',
                                  scale: 8,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Temp Min',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${state.weather.tempMin!.celsius!.round()} °C",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
