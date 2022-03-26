import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masalah/di/get_it.dart';
import 'package:masalah/presentation/blocs/masalahlist/masalahlist_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MasalahlistBloc masalahlistBloc;

  @override
  void initState() {
    super.initState();
    masalahlistBloc = getItInstance<MasalahlistBloc>();
    masalahlistBloc.add(MasalahListLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    masalahlistBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => masalahlistBloc,
      child: Scaffold(
        body: BlocBuilder<MasalahlistBloc, MasalahlistState>(
            bloc: masalahlistBloc,
            builder: (context, state) {
              if (state is MasalahlistLoaded) {
                return Text(state.masalahs[0].masalahTitle);
              }
              if (state is MasalahlistError) {
                print("8888");
                return Center(
                  child: Text(
                    state.handleException,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return Center(
                child: Text(
                  state.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              );
            }),
      ),
    );
  }
  //1
}
