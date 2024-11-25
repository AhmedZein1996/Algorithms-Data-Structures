class Item {
  final String name;
  final double weight;
  final double profit;
  double ratio;

  Item({required this.name, required this.weight, required this.profit}) : ratio = profit / weight;
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
    // Check if the item fits entirely or needs to be added fractionally
    final isFractional = item.weight > maxSpace - currentSpace;
    final double weightToAdd = isFractional ? maxSpace - currentSpace : item.weight;
    final double profitToAdd = item.ratio * weightToAdd;

    // Create the new item (full or fractional)
    final newItem = Item(name: item.name, weight: weightToAdd, profit: profitToAdd);

    // Add the item to the knapsack
    bagItems.add(newItem);
    currentSpace += newItem.weight;
    totalProfit += newItem.profit;
    totalWeight += newItem.weight;
  }
}

List<Item> items = [
  Item(name: 'item1', weight: 1, profit: 4),
  Item(name: 'item2', weight: 2, profit: 9),
  Item(name: 'item3', weight: 10, profit: 12),
  Item(name: 'item4', weight: 4, profit: 11),
  Item(name: 'item5', weight: 3, profit: 6),
  Item(name: 'item6', weight: 5, profit: 5),
];

void main() async {
  final bag = Knapsak(currentSpace: 0, totalProfit: 0, totalWeight: 0, maxSpace: 12);

  final sortedItemsByRatio = mergeSort(items);

  int j = 0;
  while (bag.currentSpace < bag.maxSpace) {
    bag.addItem(sortedItemsByRatio[j]);
    j++;
  }

  print('Bag currentSpace ${bag.currentSpace}');
  print('Bag totalProfit ${bag.totalProfit}');
  print('Bag totalWeight ${bag.totalWeight}');

  print('-------------------- Bag items --------------------');
  for (final item in bag.bagItems) {
    print(
        '${item.name} - Weight: ${item.weight} - Profit: ${item.profit.toStringAsFixed(2)} - Ratio: ${item.ratio.toStringAsFixed(2)}');
  }
  print('---------------------------------------------------');
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
