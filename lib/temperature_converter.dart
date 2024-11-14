import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController tempController = TextEditingController();
  String inputUnit = 'Celsius';
  String outputUnit = 'Fahrenheit';
  String result = "0.0";

  // Fungsi untuk melakukan konversi suhu
  void convertTemperature() {
    double inputTemp = double.tryParse(tempController.text) ?? 0;
    double convertedTemp = inputTemp;

    // Konversi suhu berdasarkan inputUnit dan outputUnit
    if (inputUnit == 'Celsius' && outputUnit == 'Fahrenheit') {
      convertedTemp = inputTemp * 9 / 5 + 32;
    } else if (inputUnit == 'Celsius' && outputUnit == 'Kelvin') {
      convertedTemp = inputTemp + 273.15;
    } else if (inputUnit == 'Celsius' && outputUnit == 'Reamur') {
      convertedTemp = inputTemp * 4 / 5;
    } else if (inputUnit == 'Fahrenheit' && outputUnit == 'Celsius') {
      convertedTemp = (inputTemp - 32) * 5 / 9;
    } else if (inputUnit == 'Fahrenheit' && outputUnit == 'Kelvin') {
      convertedTemp = (inputTemp - 32) * 5 / 9 + 273.15;
    } else if (inputUnit == 'Fahrenheit' && outputUnit == 'Reamur') {
      convertedTemp = (inputTemp - 32) * 4 / 9;
    } else if (inputUnit == 'Kelvin' && outputUnit == 'Celsius') {
      convertedTemp = inputTemp - 273.15;
    } else if (inputUnit == 'Kelvin' && outputUnit == 'Fahrenheit') {
      convertedTemp = (inputTemp - 273.15) * 9 / 5 + 32;
    } else if (inputUnit == 'Kelvin' && outputUnit == 'Reamur') {
      convertedTemp = (inputTemp - 273.15) * 4 / 5;
    } else if (inputUnit == 'Reamur' && outputUnit == 'Celsius') {
      convertedTemp = inputTemp * 5 / 4;
    } else if (inputUnit == 'Reamur' && outputUnit == 'Fahrenheit') {
      convertedTemp = inputTemp * 9 / 4 + 32;
    } else if (inputUnit == 'Reamur' && outputUnit == 'Kelvin') {
      convertedTemp = inputTemp * 5 / 4 + 273.15;
    }

    setState(() {
      result = convertedTemp.toStringAsFixed(1);
    });
  }

  void reset() {
    setState(() {
      tempController.clear();
      result = "0.0";
      inputUnit = 'Celsius';
      outputUnit = 'Fahrenheit';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temperature Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: tempController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Temperature',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                  value: inputUnit,
                  items: ['Celsius', 'Fahrenheit', 'Kelvin', 'Reamur']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      inputUnit = newValue!;
                    });
                  },
                ),
                const Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: outputUnit,
                  items: ['Celsius', 'Fahrenheit', 'Kelvin', 'Reamur']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      outputUnit = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertTemperature,
              child: const Text('SHOW RESULT'),
            ),
            ElevatedButton(
              onPressed: reset,
              child: const Text('RESET'),
            ),
          ],
        ),
      ),
    );
  }
}
