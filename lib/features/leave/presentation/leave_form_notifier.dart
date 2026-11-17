import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/error/app_exception.dart';
import '../../../core/providers/core_providers.dart';
import '../domain/models/leave_models.dart';
import '../domain/rules/leave_rules.dart';
import 'providers/leave_providers.dart';

part 'leave_form_notifier.g.dart';

@riverpod
class LeaveFormNotifier extends _$LeaveFormNotifier {
  @override
  LeaveFormState build() {
    final today = ref.watch(companyClockProvider).todayCompanyDate();
    return LeaveFormState(
      type: LeaveType.casual,
      startDate: today,
      endDate: today,
      reason: '',
    );
  }

  void setType(LeaveType type) => state = state.copyWith(type: type);

  void setStartDate(String date) {
    var end = state.endDate;
    if (end.compareTo(date) < 0) end = date;
    state = state.copyWith(startDate: date, endDate: end, errorMessage: null);
  }

  void setEndDate(String date) {
    state = state.copyWith(endDate: date, errorMessage: null);
  }

  void setReason(String reason) {
    state = state.copyWith(reason: reason, errorMessage: null);
  }

  Future<bool> submit() async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);
    final online = await ref.read(connectivityServiceProvider).isOnline;
    if (!online) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Leave requests need a network connection.',
      );
      return false;
    }

    final draft = LeaveDraft(
      type: state.type,
      startDate: state.startDate,
      endDate: state.endDate,
      reason: state.reason,
    );

    try {
      final balance = await ref.read(leaveRepositoryProvider).getBalance();
      final existing = await ref.read(leaveRepositoryProvider).getRequests();
      final today = ref.read(companyClockProvider).todayCompanyDate();
      const LeaveRules().validate(
        draft: draft,
        companyToday: today,
        balance: balance ?? const LeaveBalance(casual: 0, sick: 0),
        existing: existing,
      );

      await ref.read(leaveRepositoryProvider).submit(draft);
      state = state.copyWith(isSubmitting: false);
      return true;
    } on AppException catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.message);
      return false;
    } catch (_) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Could not submit leave request.',
      );
      return false;
    }
  }
}

class LeaveFormState {
  const LeaveFormState({
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.reason,
    this.isSubmitting = false,
    this.errorMessage,
  });

  final LeaveType type;
  final String startDate;
  final String endDate;
  final String reason;
  final bool isSubmitting;
  final String? errorMessage;

  LeaveFormState copyWith({
    LeaveType? type,
    String? startDate,
    String? endDate,
    String? reason,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return LeaveFormState(
      type: type ?? this.type,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      reason: reason ?? this.reason,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
    );
  }
}
