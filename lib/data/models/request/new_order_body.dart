import 'package:caffeshop/data/models/request/drink_body.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_order_body.g.dart';

@JsonSerializable(
    createFactory: false, explicitToJson: true, fieldRename: FieldRename.snake)
class NewOrderBody {
  String userId;
  String cartId;
  List<DrinkBody> drinks;
  String paymentMethodId;
  int total;

  NewOrderBody({
    this.userId,
    this.cartId,
    this.drinks,
    this.paymentMethodId,
    this.total,
  });

  Map<String, dynamic> toJson() => _$NewOrderBodyToJson(this);
}