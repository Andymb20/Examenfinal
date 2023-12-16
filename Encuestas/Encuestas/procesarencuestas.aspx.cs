using System;
using System.Data;
using System.Data.SqlClient;

public partial class ProcesarEncuesta : System.Web.UI.Page
{

    protected void btnEnviarEncuesta_Click(object sender, EventArgs e)
    {

        Response.Redirect("EncuestaEnviada.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Verifica si se envió el formulario
        if (IsPostBack)
        {
            // Captura los datos del formulario
            string nombre = Request.Form["nombre"];
            int edad = Convert.ToInt32(Request.Form["edad"]);
            string correo = Request.Form["correo"];
            string partidoPolitico = Request.Form["partidoPolitico"];

            // Validación a
            if (edad >= 18 && edad <= 50)
            {
                // Inserta los datos en la base de datos
                string connectionString = "Encuesta";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string insertQuery = "INSERT INTO Encuestas (Nombre, Edad, Correo, PartidoPolitico) " +
                                         "VALUES (@Nombre, @Edad, @Correo, @PartidoPolitico)";

                    SqlCommand command = new SqlCommand(insertQuery, connection);
                    command.Parameters.AddWithValue("@Nombre", nombre);
                    command.Parameters.AddWithValue("@Edad", edad);
                    command.Parameters.AddWithValue("@Correo", correo);
                    command.Parameters.AddWithValue("@PartidoPolitico", partidoPolitico);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                    catch (SqlException ex)
                    {
                        // Manejo de excepciones (registro, notificación, etc.)
                        // Puedes imprimir el mensaje de error en la página
                        Response.Write("Error al guardar en la base de datos: " + ex.Message);
                    }
                    finally
                    {
                        connection.Close();
                    }
                }

                // Redirige a una página de confirmación
                Response.Redirect("EncuestaEnviada.aspx");
            }
            else
            {
                // Muestra un mensaje de error si la edad es inválida
                Response.Write("La edad debe estar entre 18 y 50 años.");
            }
        }
    }


}

