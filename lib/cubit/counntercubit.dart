import 'package:flutter_bloc/flutter_bloc.dart';
import 'counterstate.dart';

class countercubit extends Cubit<counterstate>{
  countercubit():super(initcounterstate());
  int teamApoints=0;
  int teamBpoints=0;
  void teampoints({required String team,required int num })
  {
    if(team=='A')
      {
      teamApoints +=num;
      emit(teamAcounterstate());
      }
    else {
      teamBpoints += num;
      emit(teamBcounterstate());
    }
  }
  void reset(){
     teamApoints=0;
     teamBpoints=0;
     emit(initcounterstate());
  }
}