namespace proyecto_c
{
    class Program
    {
        static void Main()
        {
            Contacto[] directorioTelefonico = new Contacto[] {
                new Contacto("Ronald david", "3043232043", "ronald@gmail.com"),
                new Contacto("Jose perez", "3012345678", "jose@gmail.com"),
                new Contacto("Camilo andres", "3212322232", "camilo@gmail.com"),
                new Contacto("Andres cortina", "3211132323", "Andres@gmail.com"),
                new Contacto("Stiven puello", "3052220045", "stiven@gmail.com"),
            };

            Console.WriteLine("=== PRUEBAS ContactosSearches ===\n");

            Console.WriteLine("--- busquedaLinealTelefono:");
            Contacto? encontrado = ContactosSearches.BusquedaLinealTelefono(directorioTelefonico, "3012345678");
            Console.WriteLine($"   Buscar 3012345678: {encontrado?.ToString() ?? "NO ENCONTRADO"}");

            Contacto? noEncontrado = ContactosSearches.BusquedaLinealTelefono(directorioTelefonico, "3042109342");
            Console.WriteLine($"   Buscar 3042109342: {noEncontrado?.ToString() ?? "NO ENCONTRADO"}");

            Contacto? vacio = ContactosSearches.BusquedaLinealTelefono(directorioTelefonico, "");
            Console.WriteLine($"   Buscar vacio: {vacio?.ToString() ?? "NO ENCONTRADO"}");

            Console.WriteLine("==========================");
            Console.WriteLine("--- busquedaPartialNombre:");
            Contacto[] resultados = ContactosSearches.BusquedaPartialNombre(directorioTelefonico, "andres");
            Console.WriteLine("   Buscar 'andres': ");
            foreach (Contacto c in resultados)
                Console.WriteLine($"     - {c}");

            Contacto[] resultados2 = ContactosSearches.BusquedaPartialNombre(directorioTelefonico, "perez");
            Console.WriteLine("   Buscar 'perez': ");
            foreach (Contacto c in resultados2)
                Console.WriteLine($"     - {c}");

            Console.WriteLine("=========================");
            Console.WriteLine("\n BinarySearchByPhone:");
            ContactosSearches searches = new ContactosSearches();
            Contacto? binEncontrado = searches.BinarySearchByPhone(directorioTelefonico, "3211132323");
            Console.WriteLine($"Buscar 3211132323: {binEncontrado?.ToString() ?? "NO ENCONTRADO"}");

            Contacto? binNoEncontrado = searches.BinarySearchByPhone(directorioTelefonico, "9999999999");
            Console.WriteLine($"   Buscar 9999999999: {binNoEncontrado?.ToString() ?? "NO ENCONTRADO"}");

            Console.WriteLine("=========================");
            Console.WriteLine("\n BinarySearchOrInsertionPoint: ");
            Contacto nuevo = new Contacto("Jean perez", "3100000000", "nuevo@test.com");
            int idx = ContactosSearches.BinarySearchOrInsertionPoint(directorioTelefonico, nuevo);
            Console.WriteLine($"   Punto de insercion para 3100000000: {idx}");

            Console.WriteLine("\n=== CASOS EDGE ===");
            Contacto[] vacioArray = new Contacto[0];
            Console.WriteLine($"Array vacio - busquedaLinealTelefono: {ContactosSearches.BusquedaLinealTelefono(vacioArray, "123") != null}");
            Console.WriteLine($"Array vacio - busquedaPartialNombre: {ContactosSearches.BusquedaPartialNombre(vacioArray, "a").Length}");
            Console.WriteLine($"Array vacio - binarySearchByPhone: {searches.BinarySearchByPhone(vacioArray, "123") != null}");
            Console.WriteLine($"Array vacio - binarySearchOrInsertionPoint: {ContactosSearches.BinarySearchOrInsertionPoint(vacioArray, nuevo)}");
        }
    }
}