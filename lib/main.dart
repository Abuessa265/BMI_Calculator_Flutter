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

// 5.7=>meter
// double ? meter = (ft * 12 + inch) * 0.0254;
// wt/m^2 -> bmi result

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController ageController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController wtController = TextEditingController();

  double? ans = 0;
  double? x = 0;
  double? y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                dispose();
              },
              icon: Icon(Icons.replay_outlined)),
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
                      controller: ageController,
                      decoration: InputDecoration(labelText: 'Age'),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: ftController,
                      decoration: InputDecoration(labelText: 'Ht(ft)'),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: inchController,
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
                      controller: wtController,
                      decoration: InputDecoration(labelText: 'Weight (kg)'),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.greenAccent,
                        ),
                        child: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            double age =
                                double.tryParse(ageController.text) ?? 0;

                            if (age >= 18) {
                              y = age;
                              double? ft =
                                  double.tryParse(ftController.text) ?? 0;
                              double? inc =
                                  double.tryParse(inchController.text) ?? 0;
                              double? wt =
                                  double.tryParse(wtController.text) ?? 0;

                              double meter = (ft * 12 + inc) * 0.0254;

                              ans = wt / (meter * meter);
                            } else {
                              ans = 0;
                              x = ans;
                              y = 0;
                            }

                            //bmi formula applied here

                            setState(() {});
                          },
                          icon: Icon(Icons.check),
                        ),
                      ),
                      Text(
                        "TAP HERE",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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
                    NeedlePointer(value: ans?.toDouble() ?? 0)
                  ], annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Container(
                            child: Text((ans?.toStringAsFixed(2)).toString(),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You must give above 17 age',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: (y?.toDouble() ?? 0) >= 18
                                ? Colors.black
                                : Colors.red,
                            letterSpacing: 0.4),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Very Severely Underweight',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) <= 15.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      ),
                      const Spacer(),
                      Text(
                        '<=15.9',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) <= 15.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Severely Underweight',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 16.0 &&
                                    (ans?.toDouble() ?? 0) <= 16.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      ),
                      const Spacer(),
                      Text(
                        '16.0-16.9',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 16.0 &&
                                    (ans?.toDouble() ?? 0) <= 16.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Underweight',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 17.0 &&
                                    (ans?.toDouble() ?? 0) <= 18.4
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      ),
                      const Spacer(),
                      Text(
                        '17.0-18.4',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 17.0 &&
                                    (ans?.toDouble() ?? 0) <= 18.4
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Normal',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 18.5 &&
                                    (ans?.toDouble() ?? 0) <= 24.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      ),
                      const Spacer(),
                      Text(
                        '18.5-24.9',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 18.5 &&
                                    (ans?.toDouble() ?? 0) <= 24.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Overweight',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 25.0 &&
                                    (ans?.toDouble() ?? 0) <= 29.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      ),
                      const Spacer(),
                      Text(
                        '25.0-29.9',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 25.0 &&
                                    (ans?.toDouble() ?? 0) <= 29.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Obese Class |',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 30.0 &&
                                    (ans?.toDouble() ?? 0) <= 34.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      ),
                      const Spacer(),
                      Text(
                        '30.0-34.9',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 30.0 &&
                                    (ans?.toDouble() ?? 0) <= 34.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Obese Class ||',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 35.0 &&
                                    (ans?.toDouble() ?? 0) <= 39.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      ),
                      const Spacer(),
                      Text(
                        '35.0-39.9',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 35.0 &&
                                    (ans?.toDouble() ?? 0) <= 39.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Obese Class |||',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 40.0
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      ),
                      const Spacer(),
                      Text(
                        '>=40.0',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: (ans?.toDouble() ?? 0) >= 40.0
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    ageController.clear();
    ftController.clear();
    inchController.clear();
    wtController.clear();
    super.dispose();
  }
}
