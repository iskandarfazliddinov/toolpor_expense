import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'user.dart';
part 'my_state.dart';

class MyCubit extends Cubit<MyState> {

  final List<User> _users = [];

  MyCubit() : super(MyInitial());

  addUser(User user){
      _users.add(user);
      emit(UsersLoaded(users: _users));
  }

  deleteUser(int index){
    _users.removeAt(index);
    emit(UsersLoaded(users: _users));
  }

  editUser(int index,User user){
    _users[index] = user;
    emit(UsersLoaded(users: _users));
  }
}
