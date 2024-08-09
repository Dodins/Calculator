import 'package:flutter_flutcalculator/components/my_button.dart';
import 'package:flutter_flutcalculator/components/my_text_field.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final numberOne = TextEditingController();
  final numberTwo = TextEditingController();
  double? result;

  void calculate(String operation) {
    final double num1 = double.tryParse(numberOne.text) ?? 0;
    final double num2 = double.tryParse(numberTwo.text) ?? 0;

    setState(() {
      if (operation == 'Addition') {
        result = num1 + num2;
      } else if (operation == 'Subtraction') {
        result = num1 - num2;
      } else if (operation == 'Multiplication') {
        result = num1 * num2;
      } else if (operation == 'Division') {
        result = num2 != 0 ? num1 / num2 : double.nan;
      } else {
        result = null;
      }
    });
  }

  @override
  void dispose() {
    numberOne.dispose();
    numberTwo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.lightBlue,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Numbers(hintText: 'Input a value', controller: numberOne),
            Numbers(hintText: 'Input a value', controller: numberTwo),
            const SizedBox(height: 20),
            MyButton(
              onTap: () => calculate('Addition'),
              buttonText: 'Addition',
            ),
            const SizedBox(height: 20),
            MyButton(
              onTap: () => calculate('Subtraction'),
              buttonText: 'Subtraction',
            ),
            const SizedBox(height: 20),
            MyButton(
              onTap: () => calculate('Multiplication'),
              buttonText: 'Multiplication',
            ),
            const SizedBox(height: 20),
            MyButton(
              onTap: () => calculate('Division'),
              buttonText: 'Division',
            ),
            const SizedBox(height: 30),
            if (result != null)
              Text(
                'RESULT: ${result!.isNaN ? 'Cannot divide by zero' : result}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
          ],
        ),
      ),
    );
  }
}
