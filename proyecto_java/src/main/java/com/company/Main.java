package com.company;

import java.util.Arrays;

public class Main {
    public static void main(String[] args) {

        int[] a = { 7, 3, 3, 9, 1, 3 };
        System.out.println("Linear first 3 -> " + ArraySearches.linearSearch(a, 3));
        System.out.println("Linear last 3  -> " + ArraySearches.linearSearchLast(a, 3));
        System.out.println("All 3 -> " + Arrays.toString(ArraySearches.linearSearchAll(a, 3)));
        System.out.println("Sentinel 9 -> " + ArraySearches.linearSearchSentinel(a, 9));

        int[] sorted = { 1, 3, 3, 3, 7, 9, 10 };
        System.out.println("Binary 7 -> " + ArraySearches.binarySearchIter(sorted, 7));
        System.out.println("lowerBound(3) -> " + ArraySearches.lowerBound(sorted, 3));
        System.out.println("lastIndexOfSorted(3) -> " + ArraySearches.lastIndexOfSorted(sorted, 3));

        int[][] m1 = {
                { 1, 4, 7 },
                { 2, 5, 8 },
                { 3, 6, 9 }
        };
        System.out.println("Staircase 5 -> " + Arrays.toString(MatrixSearches.staircaseSearch(m1, 5)));

        int[][] m2 = {
                { 1, 3, 5 },
                { 7, 9, 11 },
                { 13, 15, 17 }
        };
        System.out.println("Flattened 15 -> " + Arrays.toString(MatrixSearches.binarySearchFlattened(m2, 15)));

        int[] n = { 2, 7, 5, 8, 2, 4 };
        System.out.println("Contains number 5? -> " + ArraySearches.contains(n, 5));

        System.out.println("Count ocurrences 2 -> " + ArraySearches.countOcurrences(n, 2));

        int[] occurrences = new int[] { 1, 2, 5, 3, 4, 5 };
        System.out
                .println("Delete occurrences of number 5 -> " + ArraySearches.deletePrimaryOccurrence(occurrences, 5));

    }
}
