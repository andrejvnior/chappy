// TODO: Implement searchable

enum GenderType { male, female, others }

class Gender {
  final int? id;
  final String? title;
  final GenderType? type;

  const Gender(this.id, this.title, this.type);
}

const genderList = [
  Gender(0, 'Male', GenderType.male),
  Gender(1, 'Female', GenderType.female),
  Gender(2, 'Others', GenderType.others),
];
