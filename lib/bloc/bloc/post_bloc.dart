import 'package:api_bloc_2023/ApiServices.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../postModel.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<loadpost>((event, emit) async {
      List<postModel> model = await getData();
      print(model);
      try {
        emit.call(postloadedState(list: model));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
