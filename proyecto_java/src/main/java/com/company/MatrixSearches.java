package com.company;

public class MatrixSearches {
    private MatrixSearches() {
    }

    public static int[] linearSearch2D(int[][] m, int target) {
        if (m == null || m.length == 0 || m[0].length == 0)
            return new int[] { -1, -1 };
        for (int i = 0; i < m.length; i++) {
            for (int j = 0; j < m[i].length; j++) {
                if (m[i][j] == target)
                    return new int[] { i, j };
            }
        }
        return new int[] { -1, -1 };
    }

    public static int[] staircaseSearch(int[][] m, int target) {
        if (m == null || m.length == 0 || m[0].length == 0)
            return new int[] { -1, -1 };
        int n = m.length, p = m[0].length;
        int i = 0, j = p - 1;
        while (i < n && j >= 0) {
            if (m[i][j] == target)
                return new int[] { i, j };
            if (m[i][j] > target)
                j--;
            else
                i++;
        }
        return new int[] { -1, -1 };
    }

    public static int[] binarySearchFlattened(int[][] m, int target) {
        if (m == null || m.length == 0 || m[0].length == 0)
            return new int[] { -1, -1 };
        int n = m.length, p = m[0].length;
        int lo = 0, hi = n * p - 1;
        while (lo <= hi) {
            int mid = lo + ((hi - lo) >>> 1);
            int r = mid / p;
            int c = mid % p;
            int val = m[r][c];
            if (val == target)
                return new int[] { r, c };
            if (val < target)
                lo = mid + 1;
            else
                hi = mid - 1;
        }
        return new int[] { -1, -1 };
    }
}
