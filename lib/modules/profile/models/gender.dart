// TODO: Implement searchable

enum GenderType { male, female, others }

class Gender {
  final int? id;
  final String? title;
  final GenderType? type;

  const Gender(this.id, this.title, this.type);
}

const genderList = [
  Gender(0, 'male', GenderType.male),
  Gender(1, 'female', GenderType.female),
  Gender(2, 'others', GenderType.others),
];
