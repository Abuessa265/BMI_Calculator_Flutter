import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const BMI(), // Wrap your app
    ),
  );
}

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.replay_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Age'),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Ht(f)'),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Ht(in)'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.male,
                        size: 30,
                      )),
                  Text(
                    '|',
                    style: TextStyle(fontSize: 24),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.female,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Weight (kg)'),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(minimum: 15, maximum: 40, ranges: <GaugeRange>[
                    GaugeRange(startValue: 0, endValue: 18, color: Colors.red),
                    GaugeRange(
                        startValue: 18, endValue: 25, color: Colors.green),
                    GaugeRange(
                        startValue: 25, endValue: 40, color: Colors.yellow)
                  ], pointers: <GaugePointer>[
                    NeedlePointer(value: 90)
                  ], annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Container(
                            child: Text('90.0',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))),
                        angle: 90,
                        positionFactor: 0.5)
                  ])
                ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Very Severely Underweight',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        '<=15.9',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Severely Underweight',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        '16.0-16.9',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Underweight',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        '17.0-18.4',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Normal',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        '18.5-24.9',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Overweight',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        '25.0-29.9',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Obese Class |',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        '30.0-34.9',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Obese Class ||',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        '35.0-39.9',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Obese Class |||',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        '>=40.0',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Normal Weight: 117-159.4 ',
                style: TextStyle(color: Colors.red, fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }
}
