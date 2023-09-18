import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;

  // si quisiera atrapar el valor seleccionado solo veo cual es
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        // puede ser este o solo Switch
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles Adiconales'),
          value: isDeveloper,
          onChanged: (value) => setState(
            () {
              isDeveloper = !isDeveloper;
            },
          ),
        ),

        RadioListTile(
          title: const Text('By Car'),
          subtitle: const Text('Viajar por auto'),
          value: Transportation.car,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(
            () {
              selectedTransportation = Transportation.car;
            },
          ),
        ),

        RadioListTile(
          title: const Text('By Boat'),
          subtitle: const Text('Viajar por bote'),
          value: Transportation.boat,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(
            () {
              selectedTransportation = Transportation.boat;
            },
          ),
        ),

        RadioListTile(
          title: const Text('By plane'),
          subtitle: const Text('Viajar por plane'),
          value: Transportation.plane,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(
            () {
              selectedTransportation = Transportation.plane;
            },
          ),
        ),
        RadioListTile(
          title: const Text('By Submarine'),
          subtitle: const Text('Viajar por submarine'),
          value: Transportation.submarine,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(
            () {
              selectedTransportation = Transportation.submarine;
            },
          ),
        ),
      ],
    );
  }
}
