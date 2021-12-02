void main() {
  var names = [1, 2, 3, 4, 5];

  print('=== now collections ====');
  names.forEach(print);
  print(names.elementAt(2));

  Iterable<String> fruits = const [
    'banana',
    'peach',
    'booty',
    'blueberry',
    'pinnable',
    'pascal'
  ];

  print(fruits.isEmpty);

  for (final fruit in fruits) {
    print(fruit.toString());
  }
  
 String firstFruitStartingwithB =  fruits.firstWhere((fruit)=> fruit.startsWith('b') || fruit.startsWith('B'));
  print(firstFruitStartingwithB);
  
  print(fruits.every((e)=> e.startsWith('b')));
  
  print(fruits.where((fruit)=> fruit.startsWith('p')));
}
