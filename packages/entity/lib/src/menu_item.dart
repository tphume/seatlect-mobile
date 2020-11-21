import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final String name;
  final String description;
  final String image;
  final String price;

  MenuItem(
      {@required this.name,
      @required this.description,
      @required this.image,
      @required this.price})
      : assert(name != null),
        assert(description != null),
        assert(image != null),
        assert(price != null);

  @override
  List<Object> get props {
    return [name, description, image, price];
  }
}
