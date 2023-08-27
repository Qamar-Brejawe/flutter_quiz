import '../network_config.dart';

class SpecializationEndpoints {
  static String getSearchSpecialization =
      NetworkConfig.getFullApiUrl('Specialization/search');
  static String getAllSpecialization =
      NetworkConfig.getFullApiUrl('Specialization/');
  static String getSialization =
      NetworkConfig.getFullApiUrl('Specialization/1');
  static String geSpecialization =
      NetworkConfig.getFullApiUrl('Specialization/2');
  static String getAllColeges =
      NetworkConfig.getFullApiUrl('Specialization/allwithcolleges');
  static String getEngColleges = NetworkConfig.getFullApiUrl('Colleges/1');
  static String getMedicColleges = NetworkConfig.getFullApiUrl('Colleges/2');
}
