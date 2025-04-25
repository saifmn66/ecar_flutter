class User {
  final String phoneNumber;
  final String email;
  final String userName;
  final List<Car> cars;
  final String passwd;
  final String role;

  User({
    required this.phoneNumber,
    required this.email,
    required this.userName,
    required this.cars,
    required this.passwd,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phoneNumber: json['PhoneNumber'],
      email: json['Email'],
      userName: json['UserName'],
      cars: (json['Car'] as List).map((carJson) => Car.fromJson(carJson)).toList(),
      passwd: json['Passwd'],
      role: json['Role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PhoneNumber': phoneNumber,
      'Email': email,
      'UserName': userName,
      'Car': cars.map((car) => car.toJson()).toList(),
      'Passwd': passwd,
      'Role': role,
    };
  }
}

class Car {
  final String carModel;
  final String carId;
  final String serialNumber;
  final int battery;

  Car({
    required this.carModel,
    required this.carId,
    required this.serialNumber,
    required this.battery,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      carModel: json['carModel'],
      carId: json['CarId'],
      serialNumber: json['SerialNumber'],
      battery: json['battery'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carModel': carModel,
      'CarId': carId,
      'SerialNumber': serialNumber,
      'battery': battery,
    };
  }
}