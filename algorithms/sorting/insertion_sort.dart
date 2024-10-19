// Insertion Sort

import 'dart:math';

void main() {
  List data = generateMassiveDataset();

  Stopwatch stopwatch = Stopwatch()..start();

  sort(data);

  stopwatch.stop();

  print('Insertion Sort took: ${stopwatch.elapsedMilliseconds} ms');
  //print('Sorted data $data');
}

List sort(List numbers) {
  for (int i = 1; i < numbers.length; i++) {
    int key = numbers[i];
    int j = i - 1;
    for (j; j >= 0; j--) {
      if (numbers[j] > key) {
        numbers[j + 1] = numbers[j];
      } else {
        break;
      }
    }
    numbers[j + 1] = key;
  }
  return numbers;
}

// Generate 1000 random integers between 1 and 1000
List<int> generateSmallDataset() {
  return List<int>.generate(1000, (_) => Random().nextInt(1000) + 1);
}

// Generate 10,000 random integers between 1 and 10,000
List<int> generateMediumDataset() {
  return List<int>.generate(10000, (_) => Random().nextInt(10000) + 1);
}

// Generate 100,000 random integers between 1 and 100,000
List<int> generateLargeDataset() {
  return List<int>.generate(100000, (_) => Random().nextInt(100000) + 1);
}

// Generate 1,000,000 random integers between 1 and 1,000,000
List<int> generateVeryLargeDataset() {
  return List<int>.generate(1000000, (_) => Random().nextInt(1000000) + 1);
}

// Generate 10,000,000 random integers between 1 and 10,000,000
List<int> generateMassiveDataset() {
  return List<int>.generate(10000000, (_) => Random().nextInt(10000000) + 1);
}
