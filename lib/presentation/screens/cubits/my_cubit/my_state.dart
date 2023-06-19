part of 'my_cubit.dart';

@immutable
abstract class MyState {}

class MyInitial extends MyState {}

class UsersLoaded extends MyState{
  final List<User> users;

  UsersLoaded({required this.users});
}
class Loading extends MyState{}
