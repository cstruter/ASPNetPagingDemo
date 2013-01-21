using System;
using System.Data;
using System.Configuration;
using System.ComponentModel;
using System.Data.SqlClient;

[DataObject()]
public class friends
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static DataTable ViewFriends(Int32 maximumRows, Int32 startRowIndex)
    {
        using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand("ViewFriends", connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@maximumRows", maximumRows);
                command.Parameters.AddWithValue("@startRowIndex", startRowIndex);
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    return dt;
                }
            }
        }
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static Int32 CountFriends()
    {
        using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand("CountFriends", connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                connection.Open();
                return Convert.ToInt32(command.ExecuteScalar());
            }
        }
    }
}
