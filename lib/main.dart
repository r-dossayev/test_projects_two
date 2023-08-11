import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    const e = {"USA":"America","China":"Asia", "Kazakhstan":"Asia", "Egypt":"Africa", "Spain":"Europa"};
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text("widget.title"),
        ),
        body: ListView.separated(
          separatorBuilder: (context, i)=>Divider(height: 10,),
            itemCount: e.length,
            itemBuilder: (context, i) =>
                ListTile(title: Text(e.keys.elementAt(i)), subtitle: Text(e.values.elementAt(i),style: TextStyle(color: Colors.red),),
                  leading: SvgPicture.asset("images/svg/user.svg",height: 30,width: 30,),
                  trailing: const Icon(Icons.arrow_forward_ios),),
        ),
    );
  }
}
