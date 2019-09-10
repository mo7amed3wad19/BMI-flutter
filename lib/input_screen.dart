import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';
import 'calculate.dart';

const numberstyle = TextStyle(fontSize: 40, fontWeight: FontWeight.w700);
const textstyle = TextStyle(fontSize: 16.0, color: Color(0xff8d8e98));
const activecolor = Color(0xff1A1E30);
const inactivecolor = Color(0xff111328);
const containerBottomhight = 80.0;
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectgender;
  int hight = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectgender = (Gender.male);
                    });
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "MALE",
                          style: textstyle,
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      color: selectgender == Gender.male
                          ? activecolor
                          : inactivecolor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectgender = (Gender.female);
                    });
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "FEMALE",
                          style: textstyle,
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      color: selectgender == Gender.female
                          ? activecolor
                          : inactivecolor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      color: Color(0xff1A1E30),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HEIGHT",
                          style: textstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              hight.toString(),
                              style: numberstyle,
                            ),
                            Text(
                              "CM",
                              style: textstyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 24.0),
                              thumbColor: Color(0xffeb1555),
                              activeTrackColor: Colors.white,
                              overlayColor: Color(0x29eb1555),
                              inactiveTrackColor: Color(0xff8d8e98)),
                          child: Slider(
                            onChanged: (double value) {
                              setState(() {
                                hight = value.round();
                              });
                            },
                            value: hight.toDouble(),
                            min: 120.0,
                            max: 220.0,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("WEIGHT", style: textstyle),
                      Text(
                        weight.toString(),
                        style: numberstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FabButtons(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(width: 10.0),
                          FabButtons(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                  margin: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    color: Color(0xff1A1E30),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
                Expanded(
                    child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("AGE ", style: textstyle),
                      Text(
                        age.toString(),
                        style: numberstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FabButtons(
                            icon: FontAwesomeIcons.minus,
                            onpress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          FabButtons(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                  margin: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    color: Color(0xff1A1E30),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculateBrain calc = CalculateBrain(hight, weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                            bmiresult: calc.calcBmi(),
                            getweight: calc.getrssult(),
                            structure: calc.structure(),
                          )));
            },
            child: Container(
              child: Center(
                  child: Text(
                "CALCULATE",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
              width: double.infinity,
              height: containerBottomhight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffEA1556),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  Cards({this.color, this.cardchild});
  final Widget cardchild;
  final Color color;
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.lable});
  final IconData icon;
  final String lable;
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          lable,
          style: TextStyle(fontSize: 18.0, color: Color(0xff8d8e98)),
        )
      ],
    );
  }
}

class FabButtons extends StatelessWidget {
  @override
  FabButtons({@required this.icon, @required this.onpress});
  final IconData icon;
  final Function onpress;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      child: Icon(icon),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      elevation: 0.6,
      fillColor: Color(0xff4c4e5f),
    );
  }
}
