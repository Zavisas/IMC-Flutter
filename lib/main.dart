// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:imc_p3/constants/color.dart';
import 'package:imc_p3/screens/imcScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DescubraIMC',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double result = 0.0;
  String classification = '';
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DescubraIMC'),
        backgroundColor: primary, // Adicionado a cor primária no header
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Informe seu peso, altura e sexo para calcular o IMC:',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: Gender.male,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
                Text('Masculino'),
                Radio(
                  value: Gender.female,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
                Text('Feminino'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Peso (kg)'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Altura (m)'),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    calculateBMI();
                  },
                  child: Text('Calcular IMC'),
                  style: ElevatedButton.styleFrom(
                    primary: secundary,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IMCTableScreen(),
                      ),
                    );
                  },
                  child: Text('Tabela IMC'),
                  style: ElevatedButton.styleFrom(
                    primary: secundary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: ${result.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Classificação: $classification',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        color: primary, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Desenvolvido por Bruno Pequeno e João Zavisas',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      double bmi;
      if (selectedGender == Gender.male) {
        bmi = weight / (height * height);
      } else {
        bmi = 0.765 * weight / (height * height);
      }

      setState(() {
        result = bmi;
        classification = classifyBMI(bmi);
      });
    } else {
      setState(() {
        result = 0.0;
        classification = '';
      });
    }
  }

  String classifyBMI(double bmi) {
    if (bmi < 18.5) {
      return 'Abaixo do Peso';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Peso Normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Sobrepeso';
    } else if (bmi >= 30 && bmi < 34.9) {
      return 'Obesidade Grau 1';
    } else if (bmi >= 35 && bmi < 39.9) {
      return 'Obesidade Grau 2';
    } else {
      return 'Obesidade Grau 3';
    }
  }
}

enum Gender { male, female }
