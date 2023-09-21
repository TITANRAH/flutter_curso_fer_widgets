import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/config/theme/app_theme.dart';

final themeProvider = StateProvider((ref) => false);

// Listado de Colores inmutables

// le paso los colores inmutables del theme a este provider para poder
// hacerlo accesible a toda la app
final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

// objeto de tipo apptheme para cosas mas elavoradasd se usa este provider

// el que controla es themenotifier y el estado es la instancia de apptheme
// eso es esto StateNotifierProvider<ThemeNotifier, AppTheme>

// el StateNotifierProvider adminisstra los estados a traves de la clase crada abajo
// themeNotifier
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  // aqui regreso la instancia
  (ref) => ThemeNotifier(),
);

// controller
// crearemos una instancia del apptheme
// a traves de eta clase se implementaran elsate notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {}

  void changeColorIndex(int colorIndex) {}

  
}
