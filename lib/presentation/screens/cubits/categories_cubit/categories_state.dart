part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class UsersLoaded extends CategoriesState{
  final List<CategoryData> users;

  UsersLoaded({required this.users});
}
