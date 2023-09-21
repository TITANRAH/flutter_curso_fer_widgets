import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/presentation/provider/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Tema'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).update((state) => !state);
            },
            icon: Icon(
              isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    // cree el provider de colores llamados del theme y ahora lo llamo
    // desde el provider
    final List<Color> colors = ref.watch(colorListProvider);
    final selectedIndexColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];

        return RadioListTile(
          title: Text(
            'Este Color',
            style: TextStyle(
              color: color,
            ),
          ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedIndexColor,
          onChanged: (value) {
            //todo notificar cambio
            ref.read(selectedColorProvider.notifier).state = value!;
          },
        );
      },
    );
  }
}


// llame los colores del theme y lo puse dentro de un provider
// llame a ese provider y pinte los radio list tile con la lista de colores 
// en su index 
// llame al provider y el groupvalue puse el indice que tambien cree en el Provider 
// el cual originalmente es cero poir lo que se pinta el primer radio 
// en el onchange llame al provider que es cero y lo iguale al color seleccionado 
// por lo que ahora se pintara segun el indice del entero que cambie el valor
