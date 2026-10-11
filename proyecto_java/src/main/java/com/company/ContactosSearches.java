package com.company;

import java.util.Optional;

public class ContactosSearches {

    public static Optional<Contacto> busquedaLinealTelefono(Contacto[] contactos, String telefonoBuscar) {
        if (telefonoBuscar == null || telefonoBuscar.isBlank()) {
            return Optional.empty();
        }
        for (Contacto c : contactos) {
            if (c.getTelefono().equals(telefonoBuscar)) {
                return Optional.of(c);
            }
        }
        return Optional.empty();
    }

    public static Contacto[] busquedaPartialNombre(Contacto[] contactos, String nombre) {
        if (nombre == null || nombre.isBlank()) {
            return new Contacto[] {};
        }
        String nombreLower = nombre.toLowerCase();
        int count = 0;
        for (Contacto c : contactos) {
            if (c.getNombre().toLowerCase().contains(nombreLower)) {
                count++;
            }
        }
        Contacto[] resulBusqueda = new Contacto[count];
        int idx = 0;
        for (int i = 0; i < contactos.length; i++) {
            if (contactos[i].getNombre().toLowerCase().contains(nombreLower)) {
                resulBusqueda[idx++] = contactos[i];
            }
        }
        return resulBusqueda;
    }

    public static void orderByPhoneSelectionSort(Contacto[] contactos) {
        if (contactos == null || contactos.length <= 1) {
            return;
        }
        int n = contactos.length;
        for (int i = 0; i < n - 1; i++) {
            int indiceMenor = i;
            for (int j = i + 1; j < n; j++) {
                String telJ = contactos[j].getTelefono();
                String telMenor = contactos[indiceMenor].getTelefono();
                if (telJ.compareTo(telMenor) < 0) {
                    indiceMenor = j;
                }
            }
            Contacto temp = contactos[i];
            contactos[i] = contactos[indiceMenor];
            contactos[indiceMenor] = temp;
        }
    }

    public Optional<Contacto> binarySearchByPhone(Contacto[] contactos, String telefonoBuscar) {
        if (contactos == null || contactos.length < 0) {
            return Optional.empty();
        }
        orderByPhoneSelectionSort(contactos);
        int izquierda = 0;
        int derecha = contactos.length - 1;

        while (izquierda <= derecha) {
            int medio = izquierda + ((derecha - izquierda) >> 1);
            Contacto medioContacto = contactos[medio];
            int comparacion = medioContacto.getTelefono().compareTo(telefonoBuscar);

            if (comparacion == 0) {
                return Optional.of(medioContacto);
            } else if (comparacion < 0) {
                izquierda = medio + 1;
            } else {
                derecha = medio - 1;
            }
        }
        return Optional.empty();
    }

    public static int binarySearchOrInsertionPoint(Contacto[] sorted, Contacto t) {
        if (sorted == null || sorted.length == 0)
            return -1;
        orderByPhoneSelectionSort(sorted);
        int lo = 0, hi = sorted.length - 1;
        while (lo <= hi) {
            int mid = lo + ((hi - lo) >>> 1);
            int comparacion = sorted[mid].getTelefono().compareTo(t.getTelefono());
            if (comparacion == 0)
                return mid;
            if (comparacion < 0)
                lo = mid + 1;
            else
                hi = mid - 1;
        }
        int puntoInsercion = lo;
        return puntoInsercion + 1;
    }
}