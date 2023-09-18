import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // creo la variable 0 para identificar el menu en drawer
  // y asi puedo pintar en la caja que esta
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // si tiene el espacio que tienen los iphone arriba
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      // digo que el selectedIndex es igual a navDrawer
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        // digo que el navdrawer es igual a value
        setState(() {
          navDrawerIndex = value;
        });
        // llamo a appMenuItem y creo la variable menu item que es appMenuItem
        // en su posicion index
        final menuItem = appMenuItem[value];
        // y luego llamo al navegadir y le paso el link
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Main'),
        ),
        // menu desde el 0 al 3
        ...appMenuItem.sublist(0, 3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More Options'),
        ),
        // menu desde el 3 en adelante
        ...appMenuItem.sublist(3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
