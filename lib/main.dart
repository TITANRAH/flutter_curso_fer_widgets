import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/config/router/app_router.dart';
import 'package:widgets/config/theme/app_theme.dart';
import 'package:widgets/presentation/provider/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final isDarkMode = ref.watch(themeProvider);
    // final selectedIndexColor = ref.watch(selectedColorProvider);

    // puedo llamar al provider que es de tipo appTheme
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme()
    );
  }
}

// defino el archivo de rutas y luego lo importo 


// para cambiar el tema de la app a oscuro o light 
// cree una propiedad en la clase apptheme que recibe un bool 
// entonces en el getTheme que esta en la clase appTheme 
// uso ese bool para determinar el tema 

//  brightness: isDarkMode ? Brightness.dark : Brightness.light, 
//  en la propiedad de la funcion que se llama aca en el main entonces 
//  desde donde cambie el valor del provider se cambiara el tema a oscuro o lighit