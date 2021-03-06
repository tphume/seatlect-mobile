import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'entity.dart';

class Business extends Equatable {
  final String id;
  final String name;
  final String type;
  final List<String> tags;
  final String description;
  final Location location;
  final String address;
  final String displayImage;
  final List<String> images;
  final List<MenuItem> menu;

  Business(
      {@required this.id,
      @required this.name,
      @required this.type,
      @required this.tags,
      @required this.description,
      @required this.location,
      @required this.address,
      @required this.displayImage,
      @required this.images,
      @required this.menu})
      : assert(id != null),
        assert(name != null),
        assert(type != null),
        assert(tags != null),
        assert(description != null),
        assert(location != null),
        assert(address != null),
        assert(images != null),
        assert(menu != null);

  @override
  List<Object> get props {
    return [
      id,
      name,
      type,
      tags,
      description,
      location,
      address,
      displayImage,
      images,
      menu
    ];
  }
}
