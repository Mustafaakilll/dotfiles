import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_model.freezed.dart';
part 'register_request_model.g.dart';

@freezed
class RegisterRequestModel with _$RegisterRequestModel {
  @JsonSerializable(explicitToJson: true)
  const factory RegisterRequestModel({
    required final String fullName,
    @JsonKey(name: 'phone_number') required final String phoneNumber,
    required final String university,
    required final List<String> selectedHobbies,
    required final String password,
    required final bool accept,
    @Default(true) final bool onMobile,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(final Map<String, dynamic> json) => _$RegisterRequestModelFromJson(json);
}
