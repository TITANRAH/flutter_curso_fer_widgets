import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      name: HomeScreen.name,
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
      name: CardsScreen.name,
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
      name: ButtonsScreen.name,
    ),
    GoRoute(
      path: '/progress',
      builder: (context, state) => const ProgressScreen(),
      name: ProgressScreen.name,
    ),
    GoRoute(
      path: '/snackbars',
      builder: (context, state) => const SnackbarScreen(),
      name: SnackbarScreen.name,
    ),
    GoRoute(
      path: '/animated',
      builder: (context, state) => const AnimatedScreen(),
      name: AnimatedScreen.name,
    ),
    GoRoute(
      path: '/ui-controls',
      builder: (context, state) => const UiControlsScreen(),
      name: UiControlsScreen.name,
    ),
    GoRoute(
      path: '/tutorial',
      builder: (context, state) => const AppTutorialScreen(),
      name: AppTutorialScreen.name,
    ),
    GoRoute(
      path: '/infinite',
      builder: (context, state) => const InfiniteScrollScreen(),
      name: InfiniteScrollScreen.name,
    ),
  ],
);
