import 'package:flutter/material.dart';

// Widget
import '../widget/gender_widget.dart';
import '../widget/data_widget.dart';

enum Gender { Male, Female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender? gender;
  var height = 180.0;
  var weight = 80;
  var age = 20;

  void opensheet() {
    // showModalBottomSheet(
    //     context: context,
    //     builder: (ctx) {
    //       return Text('data');
    //     });
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Title of Alert'),
            content: Text('Ay 7mada'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(onPressed: () {}, child: Text('ok')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0e21),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Color(0xff0a0e21),
        elevation: 10,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = Gender.Male;
                        });
                      },
                      child: GenderWidget(
                        gender: 'MALE',
                        icon: Icons.male,
                        color: gender == Gender.Male
                            ? Colors.blue
                            : Color(0xff1d1e33),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = Gender.Female;
                        });
                      },
                      child: GenderWidget(
                        gender: 'FEMALE',
                        icon: Icons.female,
                        color: gender == Gender.Female
                            ? Colors.blue
                            : Color(0xff1d1e33),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1d1e33),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Slider(
                      value: height,
                      onChanged: (val) {
                        setState(() {
                          height = val;
                        });
                      },
                      min: 80,
                      max: 220,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: DataWidget(
                      label: 'WEIGHT',
                      value: weight,
                      minus: () {
                        setState(() {
                          weight--;
                        });
                      },
                      add: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DataWidget(
                      label: 'AGE',
                      value: age,
                      minus: () {
                        setState(() {
                          age--;
                        });
                      },
                      add: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Color(0xffeb1555),
            child: MaterialButton(
              onPressed: opensheet,
              child: Text('CALCULATE'),
              height: 50,
            ),
          )
        ],
      ),
    );
  }
}
