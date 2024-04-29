import 'package:auto_route/auto_route.dart';
import 'package:cupid_media/config/route/app_router.gr.dart';
import 'package:cupid_media/core/utils/widgets/button/primary_button.dart';
import 'package:cupid_media/presentation/bloc/country/country_bloc.dart';
import 'package:cupid_media/presentation/bloc/country/country_state.dart';
import 'package:cupid_media/presentation/bloc/state/state_bloc.dart';
import 'package:cupid_media/presentation/bloc/state/state_event.dart';
import 'package:cupid_media/presentation/bloc/state/state_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/widgets/dropdown/dropdown.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? stateHasValue, countryHasValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CUPID MEDIA',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CountryBloc, CountryState>(builder: (context, state) {
              if (state is CountryLoading) {
                return const Center(
                  child:
                      CupertinoActivityIndicator(animating: false, radius: 10),
                );
              }
              if (state is CountryLoaded) {
                List<Map<String, dynamic>> data =
                    state.result.map((state) => state.toMap()).toList();
                return ReusableDropdown(
                  hintText: 'Countries',
                  items: data,
                  displayKey: 'value',
                  onChanged: (value) {
                    countryHasValue = data.firstWhere(
                      (element) => element['id'] == value,
                    )['value'];
                    setState(() {
                      stateHasValue = null;
                    });
                    context
                        .read<StateBloc>()
                        .add(OnGetState(int.parse(value.toString())));
                  },
                );
              }
              return Container();
            }),
            const SizedBox(height: 20),
            BlocBuilder<StateBloc, StateState>(builder: (context, state) {
              if (state is StateLoading) {
                return const Center(
                  child:
                      CupertinoActivityIndicator(animating: false, radius: 10),
                );
              }
              if (state is StateLoaded) {
                List<Map<String, dynamic>> data =
                    state.result.map((state) => state.toMap()).toList();
                return Column(
                  children: [
                    ReusableDropdown(
                      hintText: 'State',
                      items: data,
                      displayKey: 'value',
                      onChanged: (value) {
                        setState(() {
                          stateHasValue = data.firstWhere(
                            (element) => element['id'] == value,
                          )['value'];
                        });
                      },
                    ),
                    const SizedBox(height: 100),
                    PrimaryButton(
                        enable: stateHasValue != null,
                        onPressed: () {
                          AutoRouter.of(context).push(SecondRoute(
                              country: countryHasValue.toString(),
                              state: stateHasValue.toString()));
                        },
                        text: 'Submit')
                  ],
                );
              }
              return Container();
            }),
          ],
        ),
      ),
    );
  }
}
