import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:toolpor_expense/presentation/screens/cubits/categories_cubit/category.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial()); addUser(CategoryData user){
    emit(UsersLoaded(user: user));
  }
}
