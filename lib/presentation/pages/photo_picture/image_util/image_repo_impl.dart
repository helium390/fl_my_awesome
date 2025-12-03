// import 'package:dartz/dartz.dart';
//
// import '../../../../domain/entities/app_error.dart';
// import '../../../../domain/entities/photo.dart';
// import 'image_repo.dart';
//
// class ImageRepoImpl implements ImageRepo {
//   @override
//   Future<Either<AppError, Photo>> apiUploadPhoto(String path) async {
//     try {
//       var response = await HttpService.MULTIPART(
//           ApiConst.uploadFile,
//           RequestBodies.uploadRequestPhoto(path),
//           RequestParams.empty(),
//           RequestParams.empty());
//       var photoResult = photoFromJson(response!);
//       return Right(photoResult);
//     } catch (e) {
//       return Left(AppError(errorMessage: e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<AppError, bool>> apiRemovePhoto(String key) async {
//     try {
//       var response = await HttpService.DEL(
//           ApiConst.deletePhoto, RequestParams.deleteDocPhoto(key));
//       var result = Parser.result(response!);
//       if (result) {
//         return Right(result);
//       }
//       return Left(Parser.error(response));
//     } catch (e) {
//       return Left(AppError(errorMessage: e.toString()));
//     }
//   }
// }
