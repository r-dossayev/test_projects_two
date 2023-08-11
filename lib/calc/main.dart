// import 'package:flutter/material.dart';
//
// void main() => runApp(CalcApp());
//
// class CalcApp extends StatelessWidget {
//   const CalcApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MainPage(),
//     );
//   }
// }
//
// class MainPage extends StatefulWidget {
//   const MainPage({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     return _MainPageState();
//   }
// }
//
// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("qw"),
//       ),
//       body: diver(),
//     );
//   }
// }
//
// Widget diver() {
//   return Column(
//     children: [
//       Container(
//         height: 50,
//         decoration: const BoxDecoration(
//           color: Color(0xff121313),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Icon(
//               Icons.compare_arrows_rounded,
//               color: Colors.white,
//             ),
//             Icon(
//               Icons.add,
//               color: Color(0xffb23d10),
//             ),
//             Icon(
//               Icons.menu_open,
//               color: Colors.white,
//             ),
//             Icon(
//               Icons.home_outlined,
//               color: Colors.white,
//             ),
//             Icon(
//               Icons.more_vert,
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ),
//       textable(),
//       Divider(height: 0.3,),
//       numbers(),
//     ],
//   );
// }
//
// Widget textable() {
//   return Container(
//     height: 250,
//     padding: EdgeInsets.fromLTRB(0, 200, 30, 0),
//     width: double.infinity,
//     decoration: const BoxDecoration(
//       color: Color(0xff121313),
//     ),
//     child: Align(
//       alignment: Alignment.centerRight,
//       child: Text(
//         "0",
//         style: TextStyle(fontSize: 40, color: Color(0xfff7fdfd)),
//
//       ),
//     ),
//   );
// }
//
// Widget numbers(){
//   return Container(
//     height: 400,
//     decoration: BoxDecoration(color: Color(0xff121313)),
//
//     child: Row(
//
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//        Column(),
//        Column(),
//        Column(),
//        Column(),
//       ],
//
//     ),
//
//   );
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  final List<List<String>> buttonLabels = [
    ['7', '8', '9', '/'],
    ['4', '5', '6', 'x'],
    ['1', '2', '3', '-'],
    ['0', '.', '=', '+'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(
                '0',
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.black,
              child: Column(
                children: buttonLabels.map((row) {
                  return Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: row.map((label) {
                        return Expanded(
                          child: CalculatorButton(label: label),
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String label;

  const CalculatorButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      child: TextButton(
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
