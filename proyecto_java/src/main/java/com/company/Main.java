package com.company;

import java.util.Optional;

public class Main {
    public static void main(String[] args) {
        Contacto[] directorioTelefonico = new Contacto[] {
                new Contacto("Ronald david", "3043232043", "ronald@gmail.com"),
                new Contacto("Jose perez", "3012345678", "jose@gmail.com"),
                new Contacto("Camilo andres", "3212322232", "camilo@gmail.com"),
                new Contacto("Andres cortina", "3211132323", "Andres@gmail.com"),
                new Contacto("Stiven puello", "3052220045", "stiven@gmail.com"),
        };

        System.out.println("=== PRUEBAS ContactosSearches ===\n");

        System.out.println("--- busquedaLinealTelefono:");
        Optional<Contacto> encontrado = ContactosSearches.busquedaLinealTelefono(directorioTelefonico, "3012345678");
        System.out.println("   Buscar 3012345678: " + (encontrado.isPresent() ? encontrado.get() : "NO ENCONTRADO"));

        Optional<Contacto> noEncontrado = ContactosSearches.busquedaLinealTelefono(directorioTelefonico, "3042109342");
        System.out.println("   Buscar 3042109342: "
                + (noEncontrado.isPresent() ? noEncontrado.get() : "NO ENCONTRADO"));

        Optional<Contacto> vacio = ContactosSearches.busquedaLinealTelefono(directorioTelefonico, "");
        System.out.println("   Buscar vacio: " + (vacio.isPresent() ? vacio.get() : "NO ENCONTRADO"));

        System.out.println("==========================");
        System.out.println("--- busquedaPartialNombre:");
        Contacto[] resultados = ContactosSearches.busquedaPartialNombre(directorioTelefonico, "andres");
        System.out.println("   Buscar 'andres': ");
        for (Contacto c : resultados)
            System.out.println("     - " + c);

        Contacto[] resultados2 = ContactosSearches.busquedaPartialNombre(directorioTelefonico, "perez");
        System.out.println("   Buscar 'perez': ");
        for (Contacto c : resultados2)
            System.out.println("     - " + c);

        System.out.println("=========================");
        System.out.println("\n binarySearchByPhone:");
        ContactosSearches searches = new ContactosSearches();
        Optional<Contacto> binEncontrado = searches.binarySearchByPhone(directorioTelefonico, "3211132323");
        System.out.println("Buscar 3211132323: " + (binEncontrado.isPresent() ? binEncontrado.get() : "NO ENCONTRADO"));

        Optional<Contacto> binNoEncontrado = searches.binarySearchByPhone(directorioTelefonico, "9999999999");
        System.out.println("   Buscar 9999999999: "
                + (binNoEncontrado.isPresent() ? binNoEncontrado.get() : "NO ENCONTRADO"));

        System.out.println("=========================");
        System.out.println("\n binarySearchOrInsertionPoint: ");
        Contacto nuevo = new Contacto("Jean perez", "3100000000", "nuevo@test.com");
        int idx = ContactosSearches.binarySearchOrInsertionPoint(directorioTelefonico, nuevo);
        System.out.println("   Punto de insercion para 3100000000: " + idx);

        System.out.println("\n=== CASOS EDGE ===");
        Contacto[] vacioArray = new Contacto[0];
        System.out.println("Array vacio - busquedaLinealTelefono: "
                + ContactosSearches.busquedaLinealTelefono(vacioArray, "123").isPresent());
        System.out.println("Array vacio - busquedaPartialNombre: "
                + ContactosSearches.busquedaPartialNombre(vacioArray, "a").length);
        System.out.println(
                "Array vacio - binarySearchByPhone: " + searches.binarySearchByPhone(vacioArray, "123").isPresent());
        System.out.println("Array vacio - binarySearchOrInsertionPoint: "
                + ContactosSearches.binarySearchOrInsertionPoint(vacioArray, nuevo));
    }
}