import 'package:anime_app/data/cubit/detail_characters_cubit.dart';
import 'package:anime_app/data/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CharacterInfo extends StatefulWidget {
  final int id;

  CharacterInfo({this.id});

  @override
  _CharacterInfoState createState() => _CharacterInfoState(id : id);
}

class _CharacterInfoState extends State<CharacterInfo> {
  final int id;
  DetailCharactersCubit charactersCubit;

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  _CharacterInfoState({this.id});

  @override
  void initState() {
    super.initState();
    charactersCubit = BlocProvider.of<DetailCharactersCubit>(context);
    charactersCubit.fetchCharacters(id: id);

    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.3;
    return BlocBuilder<DetailCharactersCubit, DataState>(
      builder: (context, state) {
        if (state is DataErrorState) {
          return Center(
            child: Text(
              'Error loaded data',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        }

        if (state is DataLoadingState) {
          return Center(
            child: SpinKitDoubleBounce(
              color: Colors.black87,
              size: 100,
            ),
          );
        }

        if (state is DataLoadedState) {
          return Column(
            children: [
              AnimatedOpacity(
                opacity: closeTopContainer ? 0 : 1,
                duration: const Duration(milliseconds: 250),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: size.width,
                  alignment: Alignment.topCenter,
                  height: closeTopContainer ? 0 : categoryHeight,
                  child: Image.network(
                    charactersCubit.characters.imageUrl,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ListView(
                  controller: controller,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  children: [],
                ),
              )),
            ],
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
