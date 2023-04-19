import 'package:json_annotation/json_annotation.dart';

part 'astro.g.dart';

@JsonSerializable()
class Astro {
  @JsonKey(name: 'sunrise')
  final String sunrise;

  @JsonKey(name: 'sunset')
  final String sunset;

  @JsonKey(name: 'moonrise')
  final String moonrise;

  @JsonKey(name: 'moonset')
  final String moonset;

  @JsonKey(name: 'moon_phase')
  final String moonPhase;

  @JsonKey(name: 'moon_illumination')
  final String moonIllumination;

  @JsonKey(name: 'is_moon_up')
  final int isMoonUp;

  @JsonKey(name: 'is_sun_up')
  final int isSunUp;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);
  Map<String, dynamic> toJson() => _$AstroToJson(this);
}
