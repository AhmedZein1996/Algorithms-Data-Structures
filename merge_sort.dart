// Merge Sort

import 'dart:math';

void main() {
  List data = [9, 5, 7, 4];

  Stopwatch stopwatch = Stopwatch()..start();

  mergeSort(data, 0, data.length - 1, 0);

  stopwatch.stop();

  print('Merge Sort took: ${stopwatch.elapsedMilliseconds} ms');
//  print('sorted data = $data');
}

// mergeSort
// inputs array, start, end
mergeSort(List x, int start, int end, int flag) {
  print('flag is $flag');
  if (end <= start) {
    print('return end($end), start($start)');
    return;
  }

  int mid = ((end + start) / 2).floor();

  print('mergeSort x($x) start($start), mid($mid)');
  mergeSort(x, start, mid, 1);

  print('mergeSort x($x) mid + 1(${mid + 1}), end($end)');
  mergeSort(x, mid + 1, end, 2);

  print('merge x($x) start($start), mid($mid), end($end)');
  merge(x, start, mid, end);
}

// merge
// inputs array, start, end, midpoint
merge(List x, int start, int mid, int end) {
  int leftArrayLength = mid + 1 - start;
  int rightArrayLength = end - mid;

  // Initialize left and right arrays with the specified lengths
  // Fill with 0 or any placeholder
  List<int> leftArray = List<int>.filled(leftArrayLength, 0);
  List<int> rightArray = List<int>.filled(rightArrayLength, 0);

  for (int i = 0; i < leftArrayLength; i++) {
    leftArray[i] = x[start + i];
  }

  for (int j = 0; j < rightArrayLength; j++) {
    rightArray[j] = x[mid + 1 + j];
  }

  int i = 0, j = 0, k = start;

  while (i < leftArrayLength && j < rightArrayLength) {
    if (leftArray[i] <= rightArray[j]) {
      x[k] = leftArray[i];
      i++;
    } else {
      x[k] = rightArray[j];
      j++;
    }
    k++;
  }

  // leftArrayLength = 2, rightArrayLength = 2
  // i = 0, j = 0, k = 0
  // x ([5, 9, 4, 7])
  // left [5, 9], right [4, 7]
  // x [4, 9, 4, 7]
  // i = 0, j = 1, k = 1
  // x [4, 5, 4, 7]
  // i = 1, j = 1, k = 2
  // x [4, 5, 7, 7]
  // i = 1, j = 2, k = 3

  // exit while (i < leftArrayLength && j < rightArrayLength) j not lower than rightArrayLength

  // x [4, 5, 7, 9]

  print('merge after while (i < leftArrayLength && j < rightArrayLength)  x ($x)');

  while (i < leftArrayLength) {
    x[k] = leftArray[i];
    i++;
    k++;
  }

  while (j < rightArrayLength) {
    x[k] = rightArray[j];
    j++;
    k++;
  }
  print('merge x ($x)');
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

// Generate 100,000,000 random integers between 1 and 100,000,000
List<int> generateVeryMassiveDataset() {
  return List<int>.generate(100000000, (_) => Random().nextInt(10000000) + 1);
}

// Generate 1,000,000,000 random integers between 1 and 1,000,000,000
List<int> generateBillionDataset() {
  return List<int>.generate(1000000000, (_) => Random().nextInt(1000000000) + 1);
}
