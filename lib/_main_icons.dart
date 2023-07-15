import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ScaffoldApp',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'ScaffoldApp Home'),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Material Icon: ',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Icon(
                  Icons.home,
                  color: Colors.deepPurple,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Cupertino Icon: ',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Icon(
                  CupertinoIcons.home,
                  color: Colors.deepOrange,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'FontAwesome Icon: ',
                  style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Icon(
                  FontAwesomeIcons.house,
                  color: Colors.indigoAccent,
                )
              ],
            )
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
