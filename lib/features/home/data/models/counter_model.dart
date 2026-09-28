/// Model representing counter state data
class CounterModel {
  final int count;

  const CounterModel({required this.count});

  /// Factory constructor for JSON deserialization
  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(
      count: json['count'] as int? ?? 0,
    );
  }

  /// Convert model to JSON map
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'count': count,
    };
  }

  /// Copy model with updated count
  CounterModel copyWith({int? count}) {
    return CounterModel(
      count: count ?? this.count,
    );
  }
}
