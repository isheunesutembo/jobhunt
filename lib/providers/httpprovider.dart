
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final httpProvider=Provider((ref) => http.Client());
final secureStorageProvider=Provider((ref)=>const FlutterSecureStorage());