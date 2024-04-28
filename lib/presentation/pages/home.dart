import 'package:cupid_media/presentation/bloc/country/country_bloc.dart';
import 'package:cupid_media/presentation/bloc/country/country_state.dart';
import 'package:cupid_media/presentation/bloc/state/state_bloc.dart';
import 'package:cupid_media/presentation/bloc/state/state_event.dart';
import 'package:cupid_media/presentation/bloc/state/state_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/widgets/dropdown/dropdown.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                return ReusableDropdown(
                  hintText: 'State',
                  items: data,
                  displayKey: 'value',
                  onChanged: (value) {},
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
