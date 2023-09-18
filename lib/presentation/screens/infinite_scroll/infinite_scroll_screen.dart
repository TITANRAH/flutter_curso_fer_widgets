import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  // bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      // la posiciion en pixeles mas 500 quiere decir
      // si la posicion total es 1500 al final de la pantalla
      // entonces en el 1000 vera si al sumar 500 osea que queda en
      // 1500 ese 1500 es mayor o iguala la posicion maxima de posicion de scroll
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNexPage();
      }
      // maxscrollextent es la posicion maxima del listado
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future loadNexPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(
      const Duration(seconds: 2),
    );
    addFiveImages();
    isLoading = false;
    //todo revisar si esta montado el componente
    // if (!isMounted) return;
    // ver si esta montado el componente para redibujar
    if (!mounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void addFiveImages() {
    // .last es ultimo valor
    final lastId = imagesIds.last;

    // luego añade al arreglo la lista de numeros pero toma cada
    // elemento y sumale el ultimo capturado anteriormente

    // entonces si originalmente el arreglo es [1,2,3,4,5]

    // toma el 5 y sumale 1 2 3 4 5 quedaria 6 7 8 9 10 en el arreglo

    // luego haz el mismo proceso con el 10 (lastId), el arreglo quedaria

    // 11 12 13 14 15 y asi cada vez que haga refresh
    imagesIds.addAll(
      [1, 2, 3, 4, 5].map((e) => lastId + e),
    );
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (!mounted) return;

    isLoading = false;
    // en este caso al jhacer pull to refresh toma el ultimo id del arreglo

    // luego borra el arreglo

    // luego añade el ultimo id pero sumandole 1

    // y llama a la funcion de añadir 5 imagenes

    // por eso al hacer pull to refresh es como volver a empezar el arreglo

    // la idea es volver a tener 5 ids con el pool to refresh
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  void moveScrollToBottom() {
    // esto quiere decir q ue el usuario no esta cerca del final de la pantalla
    // si esta cerca del final realiza la funcion

    // si el pixel es 0 y le sumo 150 queda en 150 si el final es el maxScroll es 800
    // la condicion se cumple 150 es menor o igual a 800?, si por lo tanto retorna, por lo tanto
    // no estoy cerca del final,

    // si ahora al hacer scroll estoy en 700 y el final es 800, si le sumo 150 a 700
    // ahora es 850, 850 es menor o igual a 800 ?, no no se cumple la condicion, no retorna
    // y realiza la funcionalidad

    // la funcion esta hecha para que se realice si el usuario esta cerca del final o en el final
    if ((scrollController.position.pixels + 100) <=
        scrollController.position.maxScrollExtent) return;

    // si estoy cerca del final suma la posicion de pixeles a 120 osea baja el scroll
    // automatiamente
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                width: double.infinity,
                height: 300,
                fit: BoxFit.contain,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: isLoading
              ? SpinPerfect(
                  infinite: true,
                  child: const Icon(Icons.refresh_rounded),
                )
              : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined))),
    );
  }
}
