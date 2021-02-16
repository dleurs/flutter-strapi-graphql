import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  String accessToken;

  Token({this.accessToken});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Token &&
          runtimeType == other.runtimeType &&
          accessToken == other.accessToken;

  @override
  int get hashCode => accessToken.hashCode;

  @override
  String toString() {
    return 'Token{token: $accessToken}';
  }

  String toShortString() {
    String firstFive = accessToken.substring(0, 3);
    String lastFive = accessToken.substring(accessToken.length - 3);
    return '$firstFive...$lastFive';
  }
}
