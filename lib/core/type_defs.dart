

import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/util/failure.dart';

typedef FutureEither<T>=Future<Either<AppFailure,T>>;
typedef FutureVoid=FutureEither<void>;