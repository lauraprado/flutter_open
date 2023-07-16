import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ScaffoldApp',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Expanded Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // El this.title recoge el titulo que le hemos definido al poner MyHomeApp como punto de entrada
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  // Utilizo los estados para cargar los widget a través del propio estado y que por tanto sea dinámico
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon _heart = const Icon(
    Icons.favorite_border,
    color: Colors.white,
  );
  bool _liked = false;

  int _elementSelected = 0;
  String textElement = '0: Home';

  String buttonPushed = 'Ninguno';

  Widget material() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        actions: [
          IconButton(
              onPressed: (() {
                _likedChange();
              }),
              icon: _heart)
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: const [
            DrawerHeader(
                child: Text(
              'Drawer Menu',
              style: TextStyle(
                  color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
            )),
            Text('Enlace 1'),
            Text('Enlace 2'),
            Text('Enlace 3'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Púlsame',
        onPressed: (() {
          _floatingPush();
        }),
        backgroundColor: Colors.red,
        child: _heart,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              // crea un padding externo
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(
                    0), // margen en todos los lados iguales
                color: Colors.purple,
                child: const Text('E'),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.all(10), // margen en todos los lados iguales
              color: Colors.green,
              child: const Text('A'),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                child: const Text('B'),
              ),
            ),
            const Divider(
              color: Colors.purple,
              indent: 40,
              endIndent: 40,
              thickness: 50,
              height: 1,
            ),
            Expanded(
              // con expanded le decimos que se extienda todo el espacio libre del children
              flex: 2,
              // si no marcamos el flex todos los expanded tendrán el mismo tamaño
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.red,
                child: const Text('C'),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.all(0), // margen en todos los lados iguales
              color: Colors.yellow,
              child: const Text('D'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(
                  5, 20, 5, 20), // margen en todos los lados iguales
              color: Colors.pink,
              child: const Text('F'),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 50), // margen en todos los lados iguales
              color: Colors.brown,
              child: const Text('G'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.white,
                ),
                label: 'Mi cuenta'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.assessment,
                  color: Colors.white,
                ),
                label: 'Estadísticas')
          ],
          currentIndex: _elementSelected,
          onTap: _itemPushed),
    );
  }

  Widget cupertino() {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(backgroundColor: Colors.red, items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Colors.white,
            ),
            label: 'Perfil'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: Colors.white,
            ),
            label: 'Estadísticas')
      ]),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                    child: Center(
                  child: Column(
                    children: [Text('$index: Home')],
                  ),
                ));
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                    child: Center(
                  child: Column(
                    children: [Text('$index: Perfil')],
                  ),
                ));
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                    child: Center(
                  child: Column(
                    children: [Text('$index: Estadística')],
                  ),
                ));
              },
            );
          default:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                    child: Center(
                  child: Column(
                    children: [Text('$index: Home')],
                  ),
                ));
              },
            );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // UTILIZAMOS UN CONDICIONAL TERNARIO PARA SABER LA PLATAFORMA Y EJECUTAR EL SCAFFOLD CORRESPONDIENTE
    return Platform.isIOS ? cupertino() : material();
  }

  void _likedChange() {
    setState(() {
      if (_liked) {
        _heart = const Icon(
          Icons.favorite_border,
          color: Colors.white,
        );
        _liked = false;
      } else {
        _heart = const Icon(
          Icons.favorite,
          color: Colors.white,
        );
        _liked = true;
      }
    });
  }

  void _itemPushed(int index) {
    setState(() {
      _elementSelected = index;
      switch (_elementSelected) {
        case 0:
          textElement = '$_elementSelected : Home';
          break;
        case 1:
          textElement = '$_elementSelected : Mi cuenta';
          break;
        case 2:
          textElement = '$_elementSelected : Estadísticas';
          break;
      }
    });
  }

  void _floatingPush() {
    _whatButton('flo');
  }

  void _elevatedButton() {
    _whatButton('ele');
  }

  void _textButton() {
    _whatButton('text');
  }

  void _iconButton() {
    _whatButton('icon');
  }

  void _outlinedButton() {
    _whatButton('out');
  }

  void _cupertinoButton() {
    _whatButton('cup');
  }

  void _whatButton(String button) {
    setState(() {
      switch (button) {
        case 'flo':
          buttonPushed = 'Floating action';
          break;
        case 'ele':
          buttonPushed = 'ElevatedButton';
          break;
        case 'text':
          buttonPushed = 'TextButton';
          break;
        case 'icon':
          buttonPushed = 'IconButton';
          break;
        case 'out':
          buttonPushed = 'OutlinedButton';
          break;
        case 'cup':
          buttonPushed = 'CupertinoButton';
          break;
        default:
      }
    });
  }
}
