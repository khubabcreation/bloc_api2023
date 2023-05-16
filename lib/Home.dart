import 'package:api_bloc_2023/bloc/bloc/post_bloc.dart';
import 'package:api_bloc_2023/postModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Provider.of<PostBloc>(context).add(loadpost());
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is postloadedState) {
            List<postModel> list = state.list;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(index.toString()),
                  title: Text(list[index].title.toString()),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
