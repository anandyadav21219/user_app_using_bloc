import 'package:blocexample/bloc/api_bloc.dart';
import 'package:blocexample/bloc/api_event.dart';
import 'package:blocexample/bloc/api_repository.dart';
import 'package:blocexample/bloc/api_state.dart';
import 'package:blocexample/screens/more_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ApiBloc(RepositoryProvider.of<ApiRepository>(context))
            ..add(LoadDataEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: BlocBuilder<ApiBloc, ApiState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text("Please Wait...")
                    ],
                  ),
                );
              }
              if (state is LoadDataState) {
                print(state.resultsList?.length);
                return ListView.builder(
                    itemCount: state.resultsList?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final result = state.resultsList?[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple.withOpacity(0.2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${result?.picture?.large}"),
                                      fit: BoxFit.fill),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                            ),
                            Text(
                              "${result?.name?.title}.${result?.name?.first} ${result!.name!.last}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              result.email.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MoreInfo(
                                              results: result,
                                            )));
                              },
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  alignment: Alignment.bottomCenter,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                      child: Text(
                                    "More Info",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ))),
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                context.read<ApiBloc>().add(LoadDataEvent()); /// recall api on press button
                              },
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  alignment: Alignment.bottomCenter,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                      child: Text(
                                    "Change Result",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ))),
                            ),
                            const SizedBox(height: 20)
                          ],
                        ),
                      );
                    } // mainAxisAlignment: MainAxisAlignment.center,
                    );
              }
              if (state is ErrorState) {
                return Text(state.errorMessage);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
