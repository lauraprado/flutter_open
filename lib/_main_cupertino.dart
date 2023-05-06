import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  Widget build(BuildContext context) {
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
  // SCAFFOLD DE GOOGLE
  /* Widget build(BuildContext context) {
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
        onPressed: (() {
          _likedChange();
        }),
        backgroundColor: Colors.red,
        child: _heart,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              textElement,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
  } */

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
}
