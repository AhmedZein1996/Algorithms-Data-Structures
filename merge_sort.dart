// Merge Sort

import 'dart:math';

void main() {
  List data = generateMassiveDataset();

  Stopwatch stopwatch = Stopwatch()..start();

  merageSort(data, 0, data.length - 1);

  stopwatch.stop();

  print('Merge Sort took: ${stopwatch.elapsedMilliseconds} ms');
//  print('sorted data = $data');
}

// merageSort
// inputs array, start, end
merageSort(List x, int start, int end) {
  if (end <= start) return;

  int mid = ((end + start) / 2).floor();

  merageSort(x, start, mid);
  merageSort(x, mid + 1, end);

  merage(x, start, mid, end);
}

// merage
// inputs array, start, end, midpoint
merage(List x, int start, int mid, int end) {
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

// Generate 1,000,000,000 random integers between 1 and 1,000,000,000
List<int> generateBillionDataset() {
  return List<int>.generate(1000000000, (_) => Random().nextInt(1000000000) + 1);
}
