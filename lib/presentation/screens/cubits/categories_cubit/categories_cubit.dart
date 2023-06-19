import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:toolpor_expense/presentation/screens/cubits/categories_cubit/category.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final List<CategoryData> _users = [];

  CategoriesCubit() : super(CategoriesInitial());

  addUser(CategoryData user){
    _users.add(user);
    emit(UsersLoaded(users: _users));
  }
}
