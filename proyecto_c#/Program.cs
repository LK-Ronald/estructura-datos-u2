namespace proyecto_c;

public class Program
{
    public static void Main()
    {
        int[] a = { 7, 3, 3, 9, 1, 3 };
        Console.WriteLine("Linear first 3 -> " + ArraySearches.LinearSearch(a, 3));
        Console.WriteLine("Linear last 3  -> " + ArraySearches.LinearSearchLast(a, 3));
        Console.WriteLine("All 3 -> [" + string.Join(", ", ArraySearches.LinearSearchAll(a, 3)) + "]");
        Console.WriteLine("Sentinel 9 -> " + ArraySearches.LinearSearchSentinel(a, 9));

        int[] sorted = { 1, 3, 3, 3, 7, 9, 10 };
        Console.WriteLine("Binary 7 -> " + ArraySearches.BinarySearchIter(sorted, 7));
        Console.WriteLine("lowerBound(3) -> " + ArraySearches.LowerBound(sorted, 3));
        Console.WriteLine("lastIndexOfSorted(3) -> " + ArraySearches.LastIndexOfSorted(sorted, 3));

        int[][] m1 = {
            [ 1, 4, 7 ],
            [ 2, 5, 8 ],
            [ 3, 6, 9]
        };
        Console.WriteLine("Staircase 5 -> [" + string.Join(", ", MatrixSearches.StaircaseSearch(m1, 5)) + "]");

        int[][] m2 = {
            [ 1, 3, 5 ],
            [ 7, 9, 11 ],
            [ 13, 15, 17]
        };
        Console.WriteLine("Flattened 15 -> [" + string.Join(", ", MatrixSearches.BinarySearchFlattened(m2, 15)) + "]");

        int[] n = { 2, 7, 5, 8, 2, 4 };
        Console.WriteLine("Contains number 5? -> " + ArraySearches.Contains(n, 5).ToString().ToLower());

        Console.WriteLine("Count ocurrences 2 -> " + ArraySearches.CountOcurrences(n, 2));

        int[] occurrences = new int[] { 5, 2, 5, 3, 4, 5, 1 };
        Console.WriteLine("Delete occurrences of number 5 -> ["
                + string.Join(", ", ArraySearches.DeletePrimaryOccurrence(occurrences, 5)) + "]");

        Console.WriteLine("Show the index of the number minor of the array -> " + ArraySearches.ArgMin(occurrences));

        Console.WriteLine("Insert number or return index if exist the number of the array -> "
                + ArraySearches.BinarySearchOrInsertionPoint(occurrences, 16));

        int[][] matrix = {
            [1, 2, 4],
            [ 7, 4, 3 ],
            [ 8, 6, 0]
        };
        Console.WriteLine("Count number it repeat the number 5 -> " + MatrixSearches.Count(matrix, 4));
    }
}
