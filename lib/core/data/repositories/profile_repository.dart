import 'package:dartz/dartz.dart';
import 'package:quiz/core/data/models/apis/profile_info_model.dart';

import '../../enums/request_type.dart';
import '../../utils/network_util.dart';

import '../models/common_response.dart';
import '../network/endpoints/profile_endpoints.dart';
import '../network/network_config.dart';

class ProfileRepository {
  //either return left and right and must include package dartz
  Future<Either<String, List<ProfileInfoModel>>> getall() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProfileEndpoints.getInfo,
        headers: NetworkConfig.getHeaders(needAuth: false),
        //.then for enshure return response
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<ProfileInfoModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(ProfileInfoModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
