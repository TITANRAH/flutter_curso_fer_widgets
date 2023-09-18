import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const SingleChildScrollView(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Text('cards'),
                _CardsView(),
              ],
            )),
      ),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // esto regresa un iterable pero da igual funcionaria igual si le pongo .toList()
          ...cards.map(
            (card) => _CardsType1(
              label: card['label'],
              elevation: card['elevation'],
            ),
          ),
          ...cards.map(
            (card) => _CardsType2(
              label: card['label'],
              elevation: card['elevation'],
            ),
          ),
          ...cards.map(
            (card) => _CardsType3(
              label: card['label'],
              elevation: card['elevation'],
            ),
          ),
          ...cards.map(
            (card) => _CardsType4(
              label: card['label'],
              elevation: card['elevation'],
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class _CardsType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardsType1({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 5, 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_outlined,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardsType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardsType2({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        side: BorderSide(
          color: colors.outline,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 5, 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_outlined,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardsType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardsType3({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceVariant,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 5, 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_outlined,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - fill'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardsType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardsType4({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // en caso de foto esto evita que la imagen este por encima y en este caso quite los bordes redondos
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/250',
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_outlined,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
