import 'package:cupid_media/config/route/app_router.dart';
import 'package:cupid_media/injection_container.dart';
import 'package:cupid_media/presentation/bloc/country/country_bloc.dart';
import 'package:cupid_media/presentation/bloc/country/country_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/state/state_bloc.dart';

void main() {
  setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<CountryBloc>()..add(const OnGetCountry()),
        ),
        BlocProvider(
          create: (_) => locator<StateBloc>(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.red, // Set app bar color to red
          ),
        ),
      ),
    );
  }
}
