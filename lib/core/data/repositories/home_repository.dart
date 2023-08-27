import 'package:dartz/dartz.dart';
import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/apis/college_model.dart';
import '../models/apis/specialization_model.dart';
import '../models/apis/token_info.dart';
import '../models/common_response.dart';
import '../network/endpoints/user_endpoints.dart';
import '../network/network_config.dart';

class HomeRepository {
  Future<Either<String, List<SpecializationModel>>> getAllSpecialization(
      String get) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: get,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<SpecializationModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(SpecializationModel.fromJson(element));
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

  Future<Either<String, List<CollegeModel>>> getAllColleges(String get) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: get,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<CollegeModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(CollegeModel.fromJson(element));
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
