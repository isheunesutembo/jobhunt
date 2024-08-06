

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/models/usermodel.dart';
final currentUserNotifierProvider=NotifierProvider<CurrentUserNotifier,UserModel>(() =>CurrentUserNotifier.new());
class CurrentUserNotifier extends Notifier<UserModel>{
  @override
  UserModel build(){
    return null!;
  }

  void addUser(UserModel user) {
    state = user;
  }
}