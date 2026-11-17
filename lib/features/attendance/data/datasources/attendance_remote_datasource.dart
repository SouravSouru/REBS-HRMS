import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';
import '../../domain/models/attendance_event.dart';
import '../dto/attendance_dto.dart';

class AttendanceRemoteDatasource {
  AttendanceRemoteDatasource(this._dio);

  final Dio _dio;

  Future<EmployeeDto> fetchEmployee() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/employee/me');
      return EmployeeDto.fromJson(response.data!);
    } on DioException catch (e) {
      mapDioError(e);
    }
  }

  Future<List<AttendanceRecordDto>> fetchAttendance({String? month}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/attendance',
        queryParameters: {'month': ?month},
      );
      final records = response.data?['records'] as List<dynamic>? ?? [];
      return records
          .map((e) => AttendanceRecordDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      mapDioError(e);
    }
  }

  Future<AttendanceEventResponseDto> postEvent(AttendanceEvent event) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/attendance/events',
        data: attendanceEventToJson(event),
        options: Options(headers: {'Idempotency-Key': event.eventId}),
      );
      return AttendanceEventResponseDto.fromJson(response.data!);
    } on DioException catch (e) {
      mapDioError(e);
    }
  }
}
