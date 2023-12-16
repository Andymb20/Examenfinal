using System;
using System.Data;
using System.Data.SqlClient;
namespace Encuestas
{
    public class EncuestaBD
    {
        public DataTable ObtenerTodasLasEncuestas()
        {
            string connectionString = "Encuesta";
            string storedProcedure = "ObtenerEncuestas";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(storedProcedure, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();

                    try
                    {
                        connection.Open();
                        adapter.Fill(dataTable);
                    }
                    catch (SqlException ex)
                    {
                        // Manejo de excepciones
                        Console.WriteLine("Error al recuperar encuestas: " + ex.Message);
                    }
                    finally
                    {
                        connection.Close();
                    }

                    return dataTable;
                }
            }
        }
    }