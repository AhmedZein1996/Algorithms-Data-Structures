void main() {
  Map<String, int> characters = countCharFrequencies('Hello World!');

  List<List<dynamic>> characterList = characters.entries.map((entry) => [entry.key, entry.value]).toList();

  mergeSort(characterList, 0, characterList.length - 1);

  print('characterList $characterList');
}

Map<String, int> countCharFrequencies(String text) {
  final Map<String, int> characters = {};
  for (var char in text.split('')) {
    if (characters.containsKey(char)) {
      characters[char] = characters[char]! + 1;
    } else {
      characters[char] = 1;
    }
  }
  return characters;
}

mergeSort(List<List<dynamic>> characterList, int start, int end) {
  if (end <= start) return;

  int mid = ((end + start) / 2).floor();

  mergeSort(characterList, start, mid);
  mergeSort(characterList, mid + 1, end);

  merge(characterList, start, mid, end);
}

merge(List<List<dynamic>> characterList, int start, int mid, int end) {
  int leftArrayLength = mid + 1 - start;
  int rightArrayLength = end - mid;

  List<List<dynamic>> leftArray = List<List<dynamic>>.filled(leftArrayLength, []);
  List<List<dynamic>> rightArray = List<List<dynamic>>.filled(rightArrayLength, []);

  for (int i = 0; i < leftArrayLength; i++) {
    leftArray[i] = characterList[start + i];
  }

  for (int j = 0; j < rightArrayLength; j++) {
    rightArray[j] = characterList[mid + 1 + j];
  }

  int k = start;
  int i = 0;
  int j = 0;

  while (i < leftArrayLength && j < rightArrayLength) {
    if (leftArray[i][1] > rightArray[j][1]) {
      characterList[k] = leftArray[i];
      i++;
    } else {
      characterList[k] = rightArray[j];
      j++;
    }
    k++;
  }

  while (i < leftArrayLength) {
    characterList[k] = leftArray[i];
    i++;
    k++;
  }
  while (j < rightArrayLength) {
    characterList[k] = rightArray[j];
    j++;
    k++;
  }
}
