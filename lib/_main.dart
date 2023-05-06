import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      title: 'Hola mundo app', home: SafeArea(child: MyHelloWorldApp())));
}

class MyHelloWorldApp extends StatelessWidget {
  const MyHelloWorldApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.blue[100]),
              child: Row(
                children: const [
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.menu),
                    tooltip: 'Botón de navegación',
                  ),
                  Expanded(child: Text('App Hola Mundo')),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.search),
                    tooltip: 'Buscar',
                  )
                ],
              )),
          const Expanded(
            child: Center(
              child: Text(
                'Hola mundo',
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
