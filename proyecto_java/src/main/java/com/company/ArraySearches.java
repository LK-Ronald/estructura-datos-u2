package com.company;

import java.util.Comparator;

public class ArraySearches {

    private ArraySearches() {
    };

    // Busqueda lineal retorna -1 si no se encuetra, o retorna el numero del indice
    // donde se encuentra el target
    public static int linearSearch(int[] array, int target) {
        if (array == null || array.length < 0)
            return -1;
        for (int i = 0; i < array.length; i++) {
            if (array[i] == target)
                return i;
        }

        return -1;
    }

    // Todas las ocurrencias
    public static int[] linearSearchAll(int[] a, int target) {
        if (a == null || a.length == 0)
            return new int[0];

        int count = 0;

        for (int v : a)
            if (v == target)
                count++;

        int[] idx = new int[count];

        int k = 0;

        for (int i = 0; i < a.length; i++) {
            if (a[i] == target)
                idx[k++] = i;
        }
        return idx;
    }

    // Última ocurrencia
    public static int linearSearchLast(int[] a, int target) {
        if (a == null || a.length == 0)
            return -1;
        for (int i = a.length - 1; i >= 0; i--) {
            if (a[i] == target)
                return i;
        }
        return -1;
    }

    // Busqueda por centinela
    public static int linearSearchSentinel(int[] array, int target) {
        if (array == null || array.length == 0)
            return -1;
        int last = array[array.length - 1];
        int i = 0;

        while (array[i] != target)
            i++;

        array[array.length - 1] = target;

        if (i < array.length - i)
            return i;

        return (last == target) ? array.length - 1 : -1;

    }

    public static int binarySearchIter(int[] a, int target) {
        if (a == null || a.length == 0)
            return -1;
        int lo = 0, hi = a.length - 1;
        while (lo <= hi) {
            int mid = lo + ((hi - lo) >>> 1); // evita overflow
            if (a[mid] == target)
                return mid;
            if (a[mid] < target)
                lo = mid + 1;
            else
                hi = mid - 1;
        }
        return -1;
    }

    public static int binarySearchRec(int[] a, int target) {
        if (a == null || a.length == 0)
            return -1;
        return bs(a, target, 0, a.length - 1);
    }

    private static int bs(int[] a, int t, int lo, int hi) {
        if (lo > hi)
            return -1;
        int mid = lo + ((hi - lo) >>> 1);
        if (a[mid] == t)
            return mid;
        if (a[mid] < t)
            return bs(a, t, mid + 1, hi);
        return bs(a, t, lo, mid - 1);
    }

    // Primer índice >= target (lower bound) o a.length si no existe
    public static int lowerBound(int[] a, int target) {
        int lo = 0, hi = a.length;
        while (lo < hi) {
            int mid = lo + ((hi - lo) >>> 1);
            if (a[mid] < target)
                lo = mid + 1;
            else
                hi = mid;
        }
        return lo;
    }

    // Último índice <= target (upper bound - 1 semántica de índice final)
    public static int lastIndexOfSorted(int[] a, int target) {
        int lo = 0, hi = a.length;
        while (lo < hi) {
            int mid = lo + ((hi - lo) >>> 1);
            if (a[mid] <= target)
                lo = mid + 1;
            else
                hi = mid;
        }
        int idx = lo - 1;
        return (idx >= 0 && a[idx] == target) ? idx : -1;
    }

    public static <T> int binarySearch(T[] a, T target, Comparator<? super T> cmp) {
        if (a == null || a.length == 0)
            return -1;
        int lo = 0, hi = a.length - 1;
        while (lo <= hi) {
            int mid = lo + ((hi - lo) >>> 1);
            int c = cmp.compare(a[mid], target);
            if (c == 0)
                return mid;
            if (c < 0)
                lo = mid + 1;
            else
                hi = mid - 1;
        }
        return -1;
    }

    public static boolean contains(int[] a, int t) {
        if (a == null || a.length < 0) {
            return false;
        }
        int i = linearSearch(a, t);
        if (i > 0) {
            return true;
        }
        return false;
    }

    public static int countOcurrences(int[] a, int t) {
        if (a == null || a.length < 0) {
            return -1;
        }
        int count = 0;
        for (int i : a) {
            if (i == t)
                count++;
        }
        return count;
    }

    public static int[] deletePrimaryOccurrence(int[] a, int t) {
        if (a == null || a.length < 0) {
            return new int[] {};
        }
        int index = -1;
        for (int i = 0; i < a.length; i++) {
            if (a[i] == t) {
                index = i;
                break;
            }
        }
        if (index == -1) {
            int[] copia = new int[a.length];
            System.arraycopy(a, 0, copia, 0, a.length);
            return copia;
        }
        int[] copia = new int[a.length - 1];
        System.arraycopy(a, 0, copia, 0, index);
        System.arraycopy(a, index + 1, copia, index, a.length - index - 1);
        return copia;
    }
}