import 'package:json_annotation/json_annotation.dart';

part 'gopay_body.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GopayBody {
  String orderId;
  String callbackUrl;

  GopayBody({this.callbackUrl, this.orderId});

  factory GopayBody.fromJson(Map<String, dynamic> json) =>
      _$GopayBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GopayBodyToJson(this);
}
