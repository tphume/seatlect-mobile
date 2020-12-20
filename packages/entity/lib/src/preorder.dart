import 'package:entity/entity.dart';
import 'package:meta/meta.dart';

class Preorder extends MenuItem {
  final int quantity;

  Preorder(
      {@required name,
      @required description,
      @required image,
      @required price,
      @required this.quantity})
      : assert(name != null),
        assert(description != null),
        assert(image != null),
        assert(price != null),
        assert(quantity != null),
        super(name: name, description: description, image: image, price: price);

  @override
  List<Object> get props {
    return [name, description, image, price, quantity];
  }
}
