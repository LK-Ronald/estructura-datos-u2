import 'package:proyecto_dart/array_searches.dart';
import 'package:proyecto_dart/matrix_searches.dart';

void main() {
  List<int> a = [7, 3, 3, 9, 1, 3];
  print('Linear first 3 -> ${ArraySearches.linearSearch(a, 3)}');
  print('Linear last 3  -> ${ArraySearches.linearSearchLast(a, 3)}');
  print('All 3 -> ${ArraySearches.linearSearchAll(a, 3)}');
  print('Sentinel 9 -> ${ArraySearches.linearSearchSentinel(a, 9)}');

  List<int> sorted = [1, 3, 3, 3, 7, 9, 10];
  print('Binary 7 -> ${ArraySearches.binarySearchIter(sorted, 7)}');
  print('lowerBound(3) -> ${ArraySearches.lowerBound(sorted, 3)}');
  print(
    'lastIndexOfSorted(3) -> ${ArraySearches.lastIndexOfSorted(sorted, 3)}',
  );

  List<List<int>> m1 = [
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
  ];
  print('Staircase 5 -> ${MatrixSearches.staircaseSearch(m1, 5)}');

  List<List<int>> m2 = [
    [1, 3, 5],
    [7, 9, 11],
    [13, 15, 17],
  ];
  print('Flattened 15 -> ${MatrixSearches.binarySearchFlattened(m2, 15)}');

  List<int> n = [2, 7, 5, 8, 2, 4];
  print('Contains number 5? -> ${ArraySearches.contains(n, 5)}');

  print('Count ocurrences 2 -> ${ArraySearches.countOcurrences(n, 2)}');

  List<int> occurrences = [5, 2, 5, 3, 4, 5, 1];
  print(
    'Delete occurrences of number 5 -> ${ArraySearches.deletePrimaryOccurrence(occurrences, 5)}',
  );

  print(
    'Show the index of the number minor of the array -> ${ArraySearches.argMin(occurrences)}',
  );

  print(
    'Insert number or return index if exist the number of the array -> ${ArraySearches.binarySearchOrInsertionPoint(occurrences, 16)}',
  );

  List<List<int>> matrix = [
    [1, 2, 4],
    [7, 4, 3],
    [8, 6, 0],
  ];
  print(
    'Count number it repeat the number 5 -> ${MatrixSearches.count(matrix, 4)}',
  );
}
