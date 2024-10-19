import 'dart:math';

void main() {
  List data = generateUltraMassiveSortedDataset();

  Stopwatch stopwatch = Stopwatch()..start();

  int index = linerSearch(data, 1000000000);

  stopwatch.stop();

  print('Linear Search took: ${stopwatch.elapsedMilliseconds} ms');
  print('index: $index');
}

int linerSearch(List x, int key) {
  for (int i = 0; i < x.length; i++) {
    if (x[i] == key) {
      return i + 1;
    }
  }
  return -1;
}

// Generate a sorted list of integers from 0 to 1000
List<int> generateSmallSortedDataset() {
  return List<int>.generate(1001, (index) => index); // Generates numbers from 0 to 1000
}

// Generate a list of unique integers from 0 to 1000 in unsorted order
List<int> generateSmallUnsortedDataset() {
  List<int> data = List<int>.generate(1001, (index) => index);
  data.shuffle(Random()); // Shuffle the list to make it unsorted
  return data;
}

// Generate a sorted list of integers from 1 to 10,000
List<int> generateMediumSortedDataset() {
  return List<int>.generate(10000, (index) => index + 1); // Sorted numbers from 1 to 10,000
}

// Generate a list of unique integers from 1 to 10,000 in unsorted order
List<int> generateMediumUnsortedDataset() {
  List<int> data = List<int>.generate(10000, (index) => index + 1);
  data.shuffle(Random()); // Shuffle the list to make it unsorted
  return data;
}

// Generate a sorted list of integers from 1 to 100,000
List<int> generateLargeSortedDataset() {
  return List<int>.generate(100000, (index) => index + 1); // Sorted numbers from 1 to 100,000
}

// Generate a list of unique integers from 1 to 100,000 in unsorted order
List<int> generateLargeUnsortedDataset() {
  List<int> data = List<int>.generate(100000, (index) => index + 1);
  data.shuffle(Random()); // Shuffle the list to make it unsorted
  return data;
}

// Generate a sorted list of integers from 1 to 1,000,000
List<int> generateVeryLargeSortedDataset() {
  return List<int>.generate(1000000, (index) => index + 1); // Sorted numbers from 1 to 1,000,000
}

// Generate a list of unique integers from 1 to 1,000,000 in unsorted order
List<int> generateVeryLargeUnsortedDataset() {
  List<int> data = List<int>.generate(1000000, (index) => index + 1);
  data.shuffle(Random()); // Shuffle the list to make it unsorted
  return data;
}

// Generate a sorted list of integers from 1 to 10,000,000
List<int> generateMassiveSortedDataset() {
  return List<int>.generate(10000000, (index) => index + 1); // Sorted numbers from 1 to 10,000,000
}

// Generate a list of unique integers from 1 to 10,000,000 in unsorted order
List<int> generateMassiveUnsortedDataset() {
  List<int> data = List<int>.generate(10000000, (index) => index + 1);
  data.shuffle(Random()); // Shuffle the list to make it unsorted
  return data;
}

// Generate a sorted list of integers from 1 to 100,000,000
List<int> generateVeryMassiveSortedDataset() {
  return List<int>.generate(100000000, (index) => index + 1); // Sorted numbers from 1 to 100,000,000
}

// Generate a list of unique integers from 1 to 100,000,000 in unsorted order
List<int> generateVeryMassiveUnsortedDataset() {
  List<int> data = List<int>.generate(100000000, (index) => index + 1);
  data.shuffle(Random()); // Shuffle the list to make it unsorted
  return data;
}

// Generate a sorted list of integers from 1 to 1,000,000,000
List<int> generateUltraMassiveSortedDataset() {
  return List<int>.generate(1000000000, (index) => index + 1); // Sorted numbers from 1 to 1,000,000,000
}

// Generate a list of unique integers from 1 to 1,000,000,000 in unsorted order
List<int> generateUltraMassiveUnsortedDataset() {
  List<int> data = List<int>.generate(1000000000, (index) => index + 1);
  data.shuffle(Random()); // Shuffle the list to make it unsorted
  return data;
}
