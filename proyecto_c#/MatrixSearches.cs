namespace proyecto_c;

public class MatrixSearches
{
    private MatrixSearches()
    {
    }

    public static int[] LinearSearch2D(int[][]? m, int target)
    {
        if (m == null || m.Length == 0 || m[0].Length == 0)
            return new int[] { -1, -1 };
        for (int i = 0; i < m.Length; i++)
        {
            for (int j = 0; j < m[i].Length; j++)
            {
                if (m[i][j] == target)
                    return new int[] { i, j };
            }
        }
        return new int[] { -1, -1 };
    }

    public static int[] linearSearch2D(int[][]? m, int target) => LinearSearch2D(m, target);

    public static int[] StaircaseSearch(int[][]? m, int target)
    {
        if (m == null || m.Length == 0 || m[0].Length == 0)
            return new int[] { -1, -1 };
        int n = m.Length, p = m[0].Length;
        int i = 0, j = p - 1;
        while (i < n && j >= 0)
        {
            if (m[i][j] == target)
                return new int[] { i, j };
            if (m[i][j] > target)
                j--;
            else
                i++;
        }
        return new int[] { -1, -1 };
    }

    public static int[] staircaseSearch(int[][]? m, int target) => StaircaseSearch(m, target);

    public static int[] BinarySearchFlattened(int[][]? m, int target)
    {
        if (m == null || m.Length == 0 || m[0].Length == 0)
            return new int[] { -1, -1 };
        int n = m.Length, p = m[0].Length;
        int lo = 0, hi = n * p - 1;
        while (lo <= hi)
        {
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

    public static int[] binarySearchFlattened(int[][]? m, int target) => BinarySearchFlattened(m, target);

    public static int Count(int[][]? a, int t)
    {
        if (a == null || a.Length < 0)
        {
            return -1;
        }
        int count = 0;
        for (int x = 0; x < a.Length; x++)
        {
            for (int y = 0; y < a[x].Length; y++)
            {
                if (a[y][x] == t)
                {
                    count += 1;
                }
            }
        }
        return count;
    }

    public static int count(int[][]? a, int t) => Count(a, t);
}
