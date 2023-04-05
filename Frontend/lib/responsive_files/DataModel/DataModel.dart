class DataModel {
  String Price;

  DataModel.fromJson(Map<String, dynamic> json) : Price = json['Price'];

  Map<String, dynamic> toJson() => {'Price': Price};
}
