import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailAnimeCubit extends Cubit<DataState>{
  DetailAnimeCubit(DataState initialState) : super(DataEmptyState());

  Future<void> fetchDetailData({AnimeTypes type , int id}) async{
    try{
      emit(DataLoadingState());

    }catch(e){
      print(e.toString());
      emit(DataErrorState());
    }
  }
}
