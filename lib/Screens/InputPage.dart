import 'package:bmi_calculator/Constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/IconClass.dart';
import '../Components/ReusableCard.dart';
import '../Constant.dart';
import '../Components/RoundButton.dart';
import 'ResultPage.dart';
import '../Components/Botton.dart';
import 'package:bmi_calculator/CalculatorBrain.dart';

enum Gender {
  male,
  female,
}

const inactiveCardColor = Color(0xFF111328);
const activeCardColor = Color(0xFF3C3D69);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactiveCardColor;
  Color femaleColor = inactiveCardColor;
  int height = 180;
  int weight = 50;
  int age = 20;

  void updateColor(Gender gender) {
    setState(() {
      maleColor = (gender == Gender.male) ? activeCardColor : inactiveCardColor;
      femaleColor =
          (gender == Gender.female) ? activeCardColor : inactiveCardColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0b0d21),
        title: Text('BMI Calculator',
            style: AppStyles.bodyMedium),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      updateColor(Gender.male);
                    },
                    color: maleColor,
                    cardChild: IconClass(
                        icon: FontAwesomeIcons.mars, nameIcon: 'Male'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      updateColor(Gender.female);
                    },
                    color: femaleColor,
                    cardChild: IconClass(
                        icon: FontAwesomeIcons.venus, nameIcon: 'Female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      updateColor(Gender.male);
                    },
                    color: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Height'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              '$height',
                              style: TextStyle(fontSize: 50),
                            ),
                            Text(
                              ' cm',
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Color(0xFFEB1555),
                              thumbColor: Color(0xFFEB1555),
                              //thumbColor: Colors.pink,
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 14),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30)),
                          child: Slider(
                              value: height.toDouble(),
                              min: 100.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      onPress: () {},
                      color: inactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: AppStyles.bodyMedium,
                          ),
                          Text(
                            '$weight',
                            style: AppStyles.bodyLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(iconData: FontAwesomeIcons.minus,onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },),
                              SizedBox(
                                width: 20,
                              ),
                              RoundIconButton(iconData: FontAwesomeIcons.plus,onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },),
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {},
                      color: inactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: AppStyles.bodyMedium,
                          ),
                          Text(
                            '$age',
                            style: AppStyles.bodyLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(iconData: FontAwesomeIcons.minus,onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },),
                              SizedBox(
                                width: 20,
                              ),
                              RoundIconButton(iconData: FontAwesomeIcons.plus,onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          Botton(text: 'Calculate', onPrees: (){
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ResultPage(bmiResult: calc.calculateBMI(), resultText: calc.getResultText(), resultRecommendText: calc.getRecommendText());
            }));
          },),
        ],
      ),
    );
  }
}



