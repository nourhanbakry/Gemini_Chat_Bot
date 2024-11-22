

import 'package:freezed_annotation/freezed_annotation.dart';
part 'send_message_state.freezed.dart';

@freezed
class SendMessageState with _$SendMessageState {
  const factory SendMessageState.initial() = _Initial;
  const factory SendMessageState.loading() = Loading;
  const factory SendMessageState.success() = Success;
  const factory SendMessageState.failure() = Failure;
}
