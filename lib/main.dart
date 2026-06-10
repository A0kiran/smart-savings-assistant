import 'package:flutter/material.dart';

void main() {
  runApp(const SmartSavingsApp());
}

class SmartSavingsApp extends StatelessWidget {
  const SmartSavingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Savings Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final incomeController = TextEditingController();
  final expenseController = TextEditingController();

  double savings = 0;

  void calculateSavings() {
    double income = double.tryParse(incomeController.text) ?? 0;
    double expense = double.tryParse(expenseController.text) ?? 0;

    setState(() {
      savings = income - expense;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Savings Assistant"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: incomeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Monthly Income",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: expenseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Monthly Expense",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSavings,
              child: const Text("Calculate Savings"),
            ),
            const SizedBox(height: 30),
            Text(
              "Savings: ₹$savings",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}