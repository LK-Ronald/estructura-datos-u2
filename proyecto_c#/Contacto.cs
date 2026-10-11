namespace proyecto_c;

public class Contacto
{
    private string nombre;
    private string telefono;
    private string email;

    public Contacto(string nombre, string telefono, string email)
    {
        this.nombre = nombre;
        this.telefono = telefono;
        this.email = email;
    }

    public string GetNombre()
    {
        return nombre;
    }

    public string GetTelefono()
    {
        return telefono;
    }

    public string GetEmail()
    {
        return email;
    }

    public override string ToString()
    {
        return $"{nombre}: {telefono} - {email}";
    }
}