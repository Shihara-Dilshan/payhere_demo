import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:payhere_demo/screeens/tab_stack/cart_tab.dart';
import 'package:payhere_demo/screeens/tab_stack/home_tab.dart';
import 'package:payhere_demo/utils/show_bottom_modal.dart';
import 'package:payhere_demo/widgets/side_menu/side_menu.dart';

class RootPage extends HookWidget {
  RootPage({Key? key}) : super(key: key);

  final _selectedIndex = useState(0);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    CartTab(),
  ];

  void _onItemTapped(int index, BuildContext context) {
    if (index == 2) {
      ShowBottomModal.show(widget: const SideMenu(), context: context);
    } else {
      _selectedIndex.value = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex.value,
        onTap: (index) {
          _onItemTapped(index, context);
        },
      ),
    );
  }
}
