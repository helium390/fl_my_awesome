import 'package:dartz/dartz.dart';

import '../../../../domain/entities/app_error.dart';
import '../../../../domain/entities/photo.dart';

abstract class ImageRepo {
  Future<Either<AppError, Photo>> apiUploadPhoto(String path);

  Future<Either<AppError, bool>> apiRemovePhoto(String key);
}
