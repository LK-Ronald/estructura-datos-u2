class MatrixSearches {
  MatrixSearches._();

  static List<int> linearSearch2D(List<List<int>>? m, int target) {
    if (m == null || m.isEmpty || m[0].isEmpty) {
      return [-1, -1];
    }
    for (int i = 0; i < m.length; i++) {
      for (int j = 0; j < m[i].length; j++) {
        if (m[i][j] == target) {
          return [i, j];
        }
      }
    }
    return [-1, -1];
  }

  static List<int> staircaseSearch(List<List<int>>? m, int target) {
    if (m == null || m.isEmpty || m[0].isEmpty) {
      return [-1, -1];
    }
    int n = m.length, p = m[0].length;
    int i = 0, j = p - 1;
    while (i < n && j >= 0) {
      if (m[i][j] == target) {
        return [i, j];
      }
      if (m[i][j] > target) {
        j--;
      } else {
        i++;
      }
    }
    return [-1, -1];
  }

  static List<int> binarySearchFlattened(List<List<int>>? m, int target) {
    if (m == null || m.isEmpty || m[0].isEmpty) {
      return [-1, -1];
    }
    int n = m.length, p = m[0].length;
    int lo = 0, hi = n * p - 1;
    while (lo <= hi) {
      int mid = lo + ((hi - lo) >>> 1);
      int r = mid ~/ p;
      int c = mid % p;
      int val = m[r][c];
      if (val == target) {
        return [r, c];
      }
      if (val < target) {
        lo = mid + 1;
      } else {
        hi = mid - 1;
      }
    }
    return [-1, -1];
  }

  static int count(List<List<int>>? a, int t) {
    if (a == null || a.isEmpty) {
      return -1;
    }
    int count = 0;
    for (int x = 0; x < a.length; x++) {
      for (int y = 0; y < a[x].length; y++) {
        if (a[y][x] == t) {
          count += 1;
        }
      }
    }
    return count;
  }
}
