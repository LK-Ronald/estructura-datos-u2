class ArraySearches {
  ArraySearches._();

  static int linearSearch(List<int>? array, int target) {
    if (array == null || array.isEmpty) {
      return -1;
    }
    for (int i = 0; i < array.length; i++) {
      if (array[i] == target) {
        return i;
      }
    }

    return -1;
  }

  static List<int> linearSearchAll(List<int>? a, int target) {
    if (a == null || a.isEmpty) {
      return [];
    }

    int count = 0;

    for (int v in a) {
      if (v == target) {
        count++;
      }
    }

    List<int> idx = List<int>.filled(count, 0);

    int k = 0;

    for (int i = 0; i < a.length; i++) {
      if (a[i] == target) {
        idx[k++] = i;
      }
    }
    return idx;
  }

  static int linearSearchLast(List<int>? a, int target) {
    if (a == null || a.isEmpty) {
      return -1;
    }
    for (int i = a.length - 1; i >= 0; i--) {
      if (a[i] == target) {
        return i;
      }
    }
    return -1;
  }

  static int linearSearchSentinel(List<int>? array, int target) {
    if (array == null || array.isEmpty) {
      return -1;
    }
    int last = array[array.length - 1];
    int i = 0;

    while (array[i] != target) {
      i++;
    }

    array[array.length - 1] = target;

    if (i < array.length - i) {
      return i;
    }

    return (last == target) ? array.length - 1 : -1;
  }

  static int binarySearchIter(List<int>? a, int target) {
    if (a == null || a.isEmpty) {
      return -1;
    }
    int lo = 0, hi = a.length - 1;
    while (lo <= hi) {
      int mid = lo + ((hi - lo) >>> 1);
      if (a[mid] == target) {
        return mid;
      }
      if (a[mid] < target) {
        lo = mid + 1;
      } else {
        hi = mid - 1;
      }
    }
    return -1;
  }

  static int binarySearchRec(List<int>? a, int target) {
    if (a == null || a.isEmpty) {
      return -1;
    }
    return _bs(a, target, 0, a.length - 1);
  }

  static int _bs(List<int> a, int t, int lo, int hi) {
    if (lo > hi) {
      return -1;
    }
    int mid = lo + ((hi - lo) >>> 1);
    if (a[mid] == t) {
      return mid;
    }
    if (a[mid] < t) {
      return _bs(a, t, mid + 1, hi);
    }
    return _bs(a, t, lo, mid - 1);
  }

  static int lowerBound(List<int>? a, int target) {
    if (a == null) return 0;
    int lo = 0, hi = a.length;
    while (lo < hi) {
      int mid = lo + ((hi - lo) >>> 1);
      if (a[mid] < target) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    return lo;
  }

  static int lastIndexOfSorted(List<int>? a, int target) {
    if (a == null) return -1;
    int lo = 0, hi = a.length;
    while (lo < hi) {
      int mid = lo + ((hi - lo) >>> 1);
      if (a[mid] <= target) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    int idx = lo - 1;
    return (idx >= 0 && a[idx] == target) ? idx : -1;
  }

  static int binarySearch<T>(List<T>? a, T target, int Function(T a, T b) cmp) {
    if (a == null || a.isEmpty) {
      return -1;
    }
    int lo = 0, hi = a.length - 1;
    while (lo <= hi) {
      int mid = lo + ((hi - lo) >>> 1);
      int c = cmp(a[mid], target);
      if (c == 0) {
        return mid;
      }
      if (c < 0) {
        lo = mid + 1;
      } else {
        hi = mid - 1;
      }
    }
    return -1;
  }

  static bool contains(List<int>? a, int t) {
    if (a == null || a.isEmpty) {
      return false;
    }
    int i = linearSearch(a, t);
    if (i > 0) {
      return true;
    }
    return false;
  }

  static int countOcurrences(List<int>? a, int t) {
    if (a == null || a.isEmpty) {
      return -1;
    }
    int count = 0;
    for (int i in a) {
      if (i == t) {
        count++;
      }
    }
    return count;
  }

  static List<int> deletePrimaryOccurrence(List<int>? a, int t) {
    if (a == null || a.isEmpty) {
      return [];
    }
    int index = -1;
    for (int i = 0; i < a.length; i++) {
      if (a[i] == t) {
        index = i;
        break;
      }
    }
    if (index == -1) {
      return List<int>.from(a);
    }
    List<int> copia = List<int>.from(a);
    copia.removeAt(index);
    return copia;
  }

  static int argMin(List<int>? a) {
    if (a == null || a.isEmpty) {
      return -1;
    }
    int minInd = a[0];
    for (int i = 0; i < a.length; i++) {
      if (a[i] < a[minInd]) {
        minInd = i;
      }
    }
    return minInd;
  }

  static int binarySearchOrInsertionPoint(List<int>? sorted, int t) {
    if (sorted == null || sorted.isEmpty) {
      return -1;
    }
    int lo = 0, hi = sorted.length - 1;
    while (lo <= hi) {
      int mid = lo + ((hi - lo) >>> 1);
      if (sorted[mid] == t) {
        return mid;
      }
      if (sorted[mid] < t) {
        lo = mid + 1;
      } else {
        hi = mid - 1;
      }
    }
    int puntoInsercion = lo;
    return puntoInsercion + 1;
  }

  static int firstIndexOfSorted(List<int>? a, int t) {
    if (a == null || a.isEmpty) {
      return -1;
    }
    int lb = lowerBound(a, t);
    if (lb < a.length && a[lb] == t) {
      return lb;
    }
    return -1;
  }
}
