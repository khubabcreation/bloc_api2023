part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class postloadedState extends PostState {
  List<postModel> list;
  postloadedState({required this.list});
}
