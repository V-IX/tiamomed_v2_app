import 'package:json_annotation/json_annotation.dart';

part 'new_appointment.g.dart';

@JsonSerializable()
class NewAppointment {
  NewAppointment({
    required this.name,
    required this.bday,
    required this.phone,
    required this.cabinet,
    required this.sotrudnik,
    required this.uslugi,
    required this.dateTime,
    required this.comment
  });

  factory NewAppointment.fromJson(Map<String, dynamic> json) => _$NewAppointmentFromJson(json);

  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "bday")
  final String bday;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "cabinet")
  final String cabinet;
  @JsonKey(name: "specialist")
  final String sotrudnik;
  @JsonKey(name: "services")
  final String uslugi;
  @JsonKey(name: "datetime")
  final String dateTime;
  @JsonKey(name: "comment")
  final String comment;

  Map<String, dynamic> toJson() => _$NewAppointmentToJson(this);

}
