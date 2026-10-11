import 'contacto.dart';

class ContactosSearches {
  static Contacto? busquedaLinealTelefono(
    List<Contacto> contactos,
    String telefonoBuscar,
  ) {
    if (telefonoBuscar.isEmpty || telefonoBuscar.trim().isEmpty) {
      return null;
    }
    for (var c in contactos) {
      if (c.telefono == telefonoBuscar) {
        return c;
      }
    }
    return null;
  }

  static List<Contacto> busquedaPartialNombre(
    List<Contacto> contactos,
    String nombre,
  ) {
    if (nombre.isEmpty || nombre.trim().isEmpty) {
      return [];
    }
    String nombreLower = nombre.toLowerCase();
    List<Contacto> resulBusqueda = [];
    for (var c in contactos) {
      if (c.nombre.toLowerCase().contains(nombreLower)) {
        resulBusqueda.add(c);
      }
    }
    return resulBusqueda;
  }

  static void orderByPhoneSelectionSort(List<Contacto> contactos) {
    if (contactos.length <= 1) {
      return;
    }
    int n = contactos.length;
    for (int i = 0; i < n - 1; i++) {
      int indiceMenor = i;
      for (int j = i + 1; j < n; j++) {
        String telJ = contactos[j].telefono;
        String telMenor = contactos[indiceMenor].telefono;
        if (telJ.compareTo(telMenor) < 0) {
          indiceMenor = j;
        }
      }
      Contacto temp = contactos[i];
      contactos[i] = contactos[indiceMenor];
      contactos[indiceMenor] = temp;
    }
  }

  Contacto? binarySearchByPhone(
    List<Contacto> contactos,
    String telefonoBuscar,
  ) {
    if (contactos.isEmpty) {
      return null;
    }
    orderByPhoneSelectionSort(contactos);
    int izquierda = 0;
    int derecha = contactos.length - 1;

    while (izquierda <= derecha) {
      int medio = izquierda + ((derecha - izquierda) >> 1);
      Contacto medioContacto = contactos[medio];
      int comparacion = medioContacto.telefono.compareTo(telefonoBuscar);

      if (comparacion == 0) {
        return medioContacto;
      } else if (comparacion < 0) {
        izquierda = medio + 1;
      } else {
        derecha = medio - 1;
      }
    }
    return null;
  }

  static int binarySearchOrInsertionPoint(List<Contacto> sorted, Contacto t) {
    if (sorted.isEmpty) return -1;
    orderByPhoneSelectionSort(sorted);
    int lo = 0, hi = sorted.length - 1;
    while (lo <= hi) {
      int mid = lo + ((hi - lo) >> 1);
      int comparacion = sorted[mid].telefono.compareTo(t.telefono);
      if (comparacion == 0) return mid;
      if (comparacion < 0) {
        lo = mid + 1;
      } else {
        hi = mid - 1;
      }
    }
    int puntoInsercion = lo;
    return puntoInsercion + 1;
  }
}
