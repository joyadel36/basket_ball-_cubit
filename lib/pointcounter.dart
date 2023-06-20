import 'package:basketballcounter/applocal.dart';
import 'package:basketballcounter/cubit/counntercubit.dart';
import 'package:basketballcounter/cubit/counterstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderpointsCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => countercubit(),
      child:pointsCounter() ,
    );
  }
}

class pointsCounter extends StatelessWidget {
  pointsCounter({Key? key}) : super(key: key);
  int teamAPoints = 0;
  int teamBPoints = 0;

  void addOnePoint() {
    print('add one point');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<countercubit, counterstate>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text("${getLang(context, "points counter")}"),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${getLang(context, "team a")}",
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '$teamAPoints',
                          style: TextStyle(
                            fontSize: 150,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(8),
                            primary: Colors.orange,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<countercubit>(context)
                                .teampoints(team: 'A', num: 1);
                          },
                          child: Text(
                            "${getLang(context, "add 1 point")}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<countercubit>(context)
                                .teampoints(team: 'A', num: 2);
                          },
                          child: Text(
                            "${getLang(context, "add 2 points")}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<countercubit>(context)
                                .teampoints(team: 'A', num: 3);
                          },
                          child: Text(
                            "${getLang(context, "add 3 points")}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    child: VerticalDivider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${getLang(context, "team b")}",
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '$teamBPoints',
                          style: TextStyle(
                            fontSize: 150,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(8),
                            primary: Colors.orange,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<countercubit>(context)
                                .teampoints(team: 'B', num: 1);
                          },
                          child: Text(
                            "${getLang(context, "add 1 point")}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<countercubit>(context)
                                .teampoints(team: 'B', num: 2);
                          },
                          child: Text(
                            "${getLang(context, "add 2 points")}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<countercubit>(context)
                                .teampoints(team: 'B', num: 3);
                          },
                          child: Text(
                            "${getLang(context, "add 3 points")}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  primary: Colors.orange,
                  minimumSize: Size(150, 50),
                ),
                onPressed: () {
                  BlocProvider.of<countercubit>(context).reset();
                },
                child: Text(
                  "${getLang(context, "reset")}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is teamAcounterstate) {
          teamAPoints = BlocProvider.of<countercubit>(context).teamApoints;
          print(teamAPoints);
        } else if (state is teamBcounterstate) {
          teamBPoints = BlocProvider.of<countercubit>(context).teamBpoints;
          print(teamBPoints);
        } else if (state is initcounterstate) {
          teamAPoints = BlocProvider.of<countercubit>(context).teamApoints;
          teamBPoints = BlocProvider.of<countercubit>(context).teamBpoints;
        }
      },
    );
  }
}
