import 'package:flutter/material.dart';
import 'temperature_converter.dart';
import 'calculator_page.dart';
import 'login_page.dart';
import '../globals.dart'; // Import globals.dart untuk akses nama pengguna

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $registeredName!'), // Menampilkan nama pengguna
        actions: [
          IconButton(
            icon: const Icon(Icons.logout), // Ikon logout di AppBar
            onPressed: () => logout(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 39, 51, 138),
                    const Color.fromARGB(255, 117, 103, 180),
                  ],
                ),
              ),
              child: Text(
                'Hello, $registeredName!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Menutup Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.thermostat),
              title: const Text('Temperature Converter'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TemperatureConverter()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Calculator'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TemperatureConverter()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'lib/images/suhu.jpg',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 8),
                  const Text('Temperature Converter'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorPage()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'lib/images/kalkulator.jpg',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 8),
                  const Text('Calculator'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
