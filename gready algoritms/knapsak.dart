

class Item {
  final String name;
  final double weight;
  final double profit;
  double ratio;

  Item({required this.name, required this.weight, required this.profit}) : ratio = profit / weight;

  Map toJson() {
    return {
      'name': name,
      'weight': weight,
      'profit': profit,
      'ratio': ratio,
    };
  }
}

class Knapsak {
  double currentSpace;
  double maxSpace;
  double totalProfit;
  double totalWeight;

  Knapsak({
    required this.currentSpace,
    required this.maxSpace,
    required this.totalProfit,
    required this.totalWeight,
  });

  List<Item> bagItems = [];

  addItem(Item item) {
    bagItems.add(item);
    currentSpace += item.weight;
    totalProfit += item.profit;
    totalWeight += item.weight;
  }
}

List<Item> items = [
  Item(name: 'item1', weight: 10, profit: 20),
  Item(name: 'item2', weight: 1, profit: 1),
  Item(name: 'item3', weight: 5, profit: 2),
  Item(name: 'item4', weight: 4, profit: 1),
  Item(name: 'item5', weight: 3, profit: 9),
  Item(name: 'item6', weight: 2, profit: 12),
  Item(name: 'item7', weight: 8, profit: 12),
];

void main() async {
  final bag = Knapsak(currentSpace: 0, totalProfit: 0, totalWeight: 0, maxSpace: 12);

  final sortedByRatio = mergeSort(items);

  print('sorted items by ratio ${sortedByRatio.map((item) => item.toJson()).toList()}');

  for (final item in sortedByRatio) {
    if (item.weight <= bag.maxSpace - bag.currentSpace) {
      bag.addItem(item);
    } else {
      final fractionalWeight = bag.maxSpace - bag.currentSpace;
      final fractionalProfit = item.ratio * fractionalWeight;

      final fractionalItem = Item(name: item.name, weight: fractionalWeight, profit: fractionalProfit);

      bag.addItem(fractionalItem);
      break;
    }
  }

  print('bag currentSpace ${bag.currentSpace}');
  print('bag totalProfit ${bag.totalProfit}');
  print('bag totalWeight ${bag.totalWeight}');

  print('bag Items ${bag.bagItems.map((item) => item.toJson()).toList()}');
}

List<Item> mergeSort(List<Item> x) {
  if (x.length <= 1) {
    return x;
  }

  int mid = (x.length / 2).floor();

  // Split the list into two halves
  List<Item> left = mergeSort(x.sublist(0, mid));
  List<Item> right = mergeSort(x.sublist(mid));

  // Merge the sorted halves
  return merge(left, right);
}

List<Item> merge(List<Item> left, List<Item> right) {
  List<Item> result = [];
  int i = 0, j = 0;

  // Merge by ratio in descending order
  while (i < left.length && j < right.length) {
    if (left[i].ratio >= right[j].ratio) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  // Append remaining items from left, if any
  while (i < left.length) {
    result.add(left[i]);
    i++;
  }

  // Append remaining items from right, if any
  while (j < right.length) {
    result.add(right[j]);
    j++;
  }

  return result;
}
