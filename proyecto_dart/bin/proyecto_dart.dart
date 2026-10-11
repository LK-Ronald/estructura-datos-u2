import 'package:proyecto_dart/contacto.dart';
import 'package:proyecto_dart/contactos_searches.dart';

void main() {
  // Main program (from Main.java)
  List<Contacto> directorioTelefonico = [
    Contacto("Ronald david", "3043232043", "ronald@gmail.com"),
    Contacto("Jose perez", "3012345678", "jose@gmail.com"),
    Contacto("Camilo andres", "3212322232", "camilo@gmail.com"),
    Contacto("Andres cortina", "3211132323", "Andres@gmail.com"),
    Contacto("Stiven puello", "3052220045", "stiven@gmail.com"),
  ];

  print("=== PRUEBAS ContactosSearches ===\n");

  print("--- busquedaLinealTelefono:");
  Contacto? encontrado = ContactosSearches.busquedaLinealTelefono(
    directorioTelefonico,
    "3012345678",
  );
  print("   Buscar 3012345678: ${encontrado ?? "NO ENCONTRADO"}");

  Contacto? noEncontrado = ContactosSearches.busquedaLinealTelefono(
    directorioTelefonico,
    "3042109342",
  );
  print("   Buscar 3042109342: ${noEncontrado ?? "NO ENCONTRADO"}");

  Contacto? vacio = ContactosSearches.busquedaLinealTelefono(
    directorioTelefonico,
    "",
  );
  print("   Buscar vacio: ${vacio ?? "NO ENCONTRADO"}");

  print("==========================");
  print("--- busquedaPartialNombre:");
  List<Contacto> resultados = ContactosSearches.busquedaPartialNombre(
    directorioTelefonico,
    "andres",
  );
  print("   Buscar 'andres': ");
  for (var c in resultados) {
    print("     - $c");
  }

  List<Contacto> resultados2 = ContactosSearches.busquedaPartialNombre(
    directorioTelefonico,
    "perez",
  );
  print("   Buscar 'perez': ");
  for (var c in resultados2) {
    print("     - $c");
  }

  print("=========================");
  print("BinarySearchByPhone:");
  ContactosSearches searches = ContactosSearches();
  Contacto? binEncontrado = searches.binarySearchByPhone(
    directorioTelefonico,
    "3211132323",
  );
  print("Buscar 3211132323: ${binEncontrado ?? "NO ENCONTRADO"}");

  Contacto? binNoEncontrado = searches.binarySearchByPhone(
    directorioTelefonico,
    "9999999999",
  );
  print("   Buscar 9999999999: ${binNoEncontrado ?? "NO ENCONTRADO"}");

  print("=========================");
  print("BinarySearchOrInsertionPoint: ");
  Contacto nuevo = Contacto("Jean perez", "3100000000", "nuevo@test.com");
  int idx = ContactosSearches.binarySearchOrInsertionPoint(
    directorioTelefonico,
    nuevo,
  );
  print("   Punto de insercion para 3100000000: $idx");

  print("\n=== CASOS EDGE ===");
  List<Contacto> vacioArray = [];
  print(
    "Array vacio - busquedaLinealTelefono: ${ContactosSearches.busquedaLinealTelefono(vacioArray, "123") != null}",
  );
  print(
    "Array vacio - busquedaPartialNombre: ${ContactosSearches.busquedaPartialNombre(vacioArray, "a").length}",
  );
  print(
    "Array vacio - binarySearchByPhone: ${searches.binarySearchByPhone(vacioArray, "123") != null}",
  );
  print(
    "Array vacio - binarySearchOrInsertionPoint: ${ContactosSearches.binarySearchOrInsertionPoint(vacioArray, nuevo)}",
  );
}
