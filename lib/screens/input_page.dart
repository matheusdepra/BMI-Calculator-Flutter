import 'package:bmi_calculator/calculartor_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/card.dart';
import '../components/gender_content.dart';
import '../constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';

enum Gender { MALE, FEMALE }
int height = 180;
int weight = 60;
int age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.MALE;
                        });
                      },
                      cardColor: selectedGender == Gender.MALE
                          ? activeColor
                          : inactiveColor,
                      cardChild: genderContent(
                        gender: "MALE",
                        genderIcon: FontAwesomeIcons.mars,
                      )),
                ),
                Expanded(
                  child: BMICard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.FEMALE;
                        });
                      },
                      cardColor: selectedGender == Gender.FEMALE
                          ? activeColor
                          : inactiveColor,
                      cardChild: genderContent(
                        gender: "FEMALE",
                        genderIcon: FontAwesomeIcons.venus,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    cardColor: cardBgd,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kSecondaryTextStyle,
                            ),
                            Text(
                              "cm",
                              style: kThirdTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              thumbColor: kSliderThumbColor,
                              activeTrackColor: kSliderActiveColor,
                              overlayColor: kOverlayThumbColor,
                              inactiveTrackColor: kSliderInactiveColor),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newHeight) {
                              setState(() {
                                height = newHeight.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    cardColor: cardBgd,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kSecondaryTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                      cardColor: cardBgd,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kSecondaryTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          BottomButton(
            onPress: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  interpretation: calc.getInterpretation(),
                  resultText: calc.getResult(),
                );
              }));
            },
            buttonTitle: 'Calculate',
          ),
        ],
      ),
    );
  }
}
