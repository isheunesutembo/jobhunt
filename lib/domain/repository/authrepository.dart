
import 'package:jobhunt/domain/models/usermodel.dart';

abstract class AuthRepository{
Future<void>logInUser(String email,String password);
Future<void>registerUser(String email,String username,String password);
 }