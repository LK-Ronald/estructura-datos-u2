
namespace proyecto_c
{
    public class ContactosSearches
    {
        public static Contacto? BusquedaLinealTelefono(Contacto[] contactos, string telefonoBuscar)
        {
            if (string.IsNullOrEmpty(telefonoBuscar) || string.IsNullOrWhiteSpace(telefonoBuscar))
            {
                return null;
            }
            foreach (Contacto c in contactos)
            {
                if (c.GetTelefono().Equals(telefonoBuscar))
                {
                    return c;
                }
            }
            return null;
        }

        public static Contacto[] BusquedaPartialNombre(Contacto[] contactos, string nombre)
        {
            if (string.IsNullOrEmpty(nombre) || string.IsNullOrWhiteSpace(nombre))
            {
                return Array.Empty<Contacto>();
            }
            string nombreLower = nombre.ToLower();
            int count = 0;
            foreach (Contacto c in contactos)
            {
                if (c.GetNombre().ToLower().Contains(nombreLower))
                {
                    count++;
                }
            }
            Contacto[] resulBusqueda = new Contacto[count];
            int idx = 0;
            for (int i = 0; i < contactos.Length; i++)
            {
                if (contactos[i].GetNombre().ToLower().Contains(nombreLower))
                {
                    resulBusqueda[idx++] = contactos[i];
                }
            }
            return resulBusqueda;
        }

        public static void OrderByPhoneSelectionSort(Contacto[] contactos)
        {
            if (contactos == null || contactos.Length <= 1)
            {
                return;
            }
            int n = contactos.Length;
            for (int i = 0; i < n - 1; i++)
            {
                int indiceMenor = i;
                for (int j = i + 1; j < n; j++)
                {
                    string telJ = contactos[j].GetTelefono();
                    string telMenor = contactos[indiceMenor].GetTelefono();
                    if (telJ.CompareTo(telMenor) < 0)
                    {
                        indiceMenor = j;
                    }
                }
                Contacto temp = contactos[i];
                contactos[i] = contactos[indiceMenor];
                contactos[indiceMenor] = temp;
            }
        }

        public Contacto? BinarySearchByPhone(Contacto[] contactos, string telefonoBuscar)
        {
            if (contactos == null || contactos.Length < 0)
            {
                return null;
            }
            OrderByPhoneSelectionSort(contactos);
            int izquierda = 0;
            int derecha = contactos.Length - 1;

            while (izquierda <= derecha)
            {
                int medio = izquierda + ((derecha - izquierda) >> 1);
                Contacto medioContacto = contactos[medio];
                int comparacion = medioContacto.GetTelefono().CompareTo(telefonoBuscar);

                if (comparacion == 0)
                {
                    return medioContacto;
                }
                else if (comparacion < 0)
                {
                    izquierda = medio + 1;
                }
                else
                {
                    derecha = medio - 1;
                }
            }
            return null;
        }

        public static int BinarySearchOrInsertionPoint(Contacto[] sorted, Contacto t)
        {
            if (sorted == null || sorted.Length == 0)
                return -1;
            OrderByPhoneSelectionSort(sorted);
            int lo = 0, hi = sorted.Length - 1;
            while (lo <= hi)
            {
                int mid = lo + ((hi - lo) >> 1);
                int comparacion = sorted[mid].GetTelefono().CompareTo(t.GetTelefono());
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
}