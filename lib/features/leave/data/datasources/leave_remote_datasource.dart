import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';
import '../../domain/models/leave_models.dart';
import '../dto/leave_dto.dart';

class LeaveRemoteDatasource {
  LeaveRemoteDatasource(this._dio);

  final Dio _dio;

  Future<LeaveBalanceDto> fetchBalance() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/leave/balance');
      return LeaveBalanceDto.fromJson(response.data!);
    } on DioException catch (e) {
      mapDioError(e);
    }
  }

  Future<List<LeaveRequestDto>> fetchRequests() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/leave/requests');
      final list = response.data?['requests'] as List<dynamic>? ?? [];
      return list
          .map((e) => LeaveRequestDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      mapDioError(e);
    }
  }

  Future<LeaveRequestDto> submit(LeaveDraft draft) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/leave/requests',
        data: leaveDraftToJson(draft),
      );
      return LeaveRequestDto.fromJson(response.data!);
    } on DioException catch (e) {
      mapDioError(e);
    }
  }
}
