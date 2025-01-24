import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/features/vacancy/models/vacancy.dart';



part 'favourite.freezed.dart';
part 'favourite.g.dart';

List<Favourite> favouritesFromJson(dynamic str) =>
    List<Favourite>.from((str).map((e) => Favourite.fromJson(e)));

@freezed
abstract class Favourite with _$Favourite {
  @JsonSerializable(explicitToJson: true,anyMap: true)
  factory Favourite({Vacancy? vacancy, String? userId, String? favoriteId}) =
      _Favourite;
  factory Favourite.fromJson(Map<String, dynamic> json) =>
      _$FavouriteFromJson(json);
}
