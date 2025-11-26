import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      home: const MyHomePage(title: 'vcarros'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counterPouza = 0;
  int _counterDu = 0;

  void _incrementCounter() {
    setState(() {
      _counterPouza++;
    });
  }
   void _desincrementCounter() {
    setState(() {
      _counterPouza--;
    });
  }

  void _eduIncrementCounter() {
    setState(() {
      _counterDu++;
    });
  }
 void _eduDesincrementCounter() {
    setState(() {
      _counterDu--;
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
       child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _desincrementCounter,
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 10),
        const Text('Pouza deu '),
        Text(
          '$_counterPouza',
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        const Text(' vezes pro Vava'),

        const SizedBox(width: 10),

        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Icon(Icons.add),
        ),
      ],
    ),

    const SizedBox(height: 20),

    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _eduDesincrementCounter,
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 10),

        const Text('Edu deu '),

        Text(
          '$_counterDu',
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        const Text(' vezes pro Vava'),

        const SizedBox(width: 10),

        ElevatedButton(
          onPressed: _eduIncrementCounter,
          child: const Icon(Icons.add),
        ),
      ],
    ),
  ],
  
)

        
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    FloatingActionButton(
      heroTag: "btn1",
      onPressed: _incrementCounter,
      child: const Icon(Icons.add),
    ),

    const SizedBox(width: 20), // espaço entre eles

    FloatingActionButton(
      heroTag: "btn2",
      onPressed: _desincrementCounter,
      child: const Icon(Icons.remove),
    ),
  ],
),
    );
  
  }

  
}
