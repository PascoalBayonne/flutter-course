import 'dart:math';

class Bicycle {
  int cadence;
  int speed;
  int gear;

  //constructor with optional params
  Bicycle({this.cadence = 0, this.speed = 0, this.gear = 0});
  //if you have a lot of arguments you can even use a @required in order to force the one that should exists
  /*Bicycle({ @required int cadence, int speed = 0, int gear = 0}){
			this.cadence = cadence;
			this.speed = speed;
			this.gear = gear;
  }
  NOTE: the @required is only available in Flutter
  */ 

  @override
  String toString() => 'Cadence: $cadence and speed: $speed and gear: $gear';
}

class Person {
  final String _name = 'Pascoal';
  int age;
  double height;

  Person(this.age, this.height);

  @override
  String toString() => 'Person age:$age, name $_name, height: $height';

  String getName() => _name;

  int computeMyBirthYear() {
    var currentYear = 2021;
    return currentYear - age;
  }
}

//lesson 4 factory + abstraction (interface and abstract class)
abstract class Shape {
  num get area;

  //Create a factory constructor
  factory Shape(String typeOfShape) {
    if ('circle' == typeOfShape) {
      return Circle(2);
    }
    if ('square' == typeOfShape) return Square(2);
    throw "can't create shape of type: $typeOfShape";
  }
}

class Circle implements Shape {
  final num radius;

  Circle(this.radius);
  @override
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);

  @override
  num get area => pow(side, 3);
}

//5. Implement an interface
abstract class Animal {
  //has no method body because it is an interface
  String get getName;

  factory Animal(String type) {
    if ('dog' == type) return Dog();
    if ('cat' == type) return Cat();
    throw 'cannot create instance of: $type';
  }
}

class Dog implements Animal {
  String name;
  Dog({this.name = 'Doggy'});

  @override
  String get getName => name;
}

class Cat implements Animal {
  String name;
  Cat({this.name = 'Catalina'});

  @override
  String get getName => name;
}

class Mops implements Dog {
  @override
  String name;
  Mops(this.name);

  @override
  String get getName => name.toUpperCase();
}

void main() {
  //The new keyword became optional in Dart 2.
  var personOne = Person(29, 1.68);

  print(personOne);
  print(personOne.computeMyBirthYear());

  //initializing the Bicycle with different optional params (constructors)
  print(Bicycle());
  print(Bicycle(cadence: 1, speed: 2));
  print(Bicycle(cadence: 10, speed: 20, gear: 100));

  //initializing
  Circle circle = Circle(10);
  print(circle.area);

  var square = Square(10);
  print(square.area);

  final circ = Shape('circle');
  print(circ.area);

  final snoopDoggy = Animal('dog');
  print(snoopDoggy.getName);

  final mops = Mops('Mopsey');
  print(mops.getName);
}
