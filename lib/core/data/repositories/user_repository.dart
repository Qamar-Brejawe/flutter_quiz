//
// class UserRepository {
//   Future<Either<String, TokenInfo>> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//         type: RequestType.POST,
//         url: UserEndpoints.login,
//         body: {
//           'userName': email,
//           'password': password,
//         },
//         headers: NetworkConfig.getHeaders(needAuth: false),
//       ).then((response) {
//         CommonResponse<Map<String, dynamic>> commonResponse = CommonResponse.fromJson(response);
//
//         if (commonResponse.getStatus) {
//           return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
//         } else {
//           return Left(commonResponse.message ?? '');
//         }
//       });
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
//
//   Future<Either<String, bool>> register({
//     required String email,
//     required String password,
//     required String firstname,
//     required String lastname,
//     required int age,
//     required String photoPath,
//   }) async {
//     try {
//       return NetworkUtil.sendMultipartRequest(
//         type: RequestType.POST,
//         url: UserEndpoints.register,
//         fields: {
//           'Email': email,
//           'FirstName': firstname,
//           'LastName': lastname,
//           'Password': password,
//           'Age': age.toString(),
//         },
//         files: {"Photo": photoPath},
//         headers: NetworkConfig.getHeaders(needAuth: false),
//       ).then((response) {
//         CommonResponse<Map<String, dynamic>> commonResponse = CommonResponse.fromJson(response);
//
//         if (commonResponse.getStatus) {
//           return Right(commonResponse.getStatus);
//         } else {
//           return Left(commonResponse.message ?? '');
//         }
//       });
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
// }
