using BEFit.Domain;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace BEFit.Services
{
    public class ClientService
    {
        private string ConnectionString { get; }

        public ClientService()
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            ConnectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public List<Client> GetAllClients()
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetAllClients", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    List<Client> clients = new List<Client>();

                    command.Connection.Open();

                    using (var dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            while (dataReader.Read())
                            {
                                Client client = new Client
                                {
                                    ClientId = dataReader.GetInt32("ClientId"),
                                    NickName = dataReader.GetString("NickName"),
                                    UserId = dataReader.IsDBNull("UserId") ? null : (int?)dataReader.GetInt32("UserId")
                                };
                                clients.Add(client);
                            }
                        }
                    }

                    return clients;
                }
            }
        }

        public Client GetClientById(int ClientId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetClientById", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    Client client = new Client();

                    SqlParameter parameter;
                    parameter = new SqlParameter
                    {
                        ParameterName = "@ClientId",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = ClientId
                    };
                    command.Parameters.Add(parameter);

                    command.Connection.Open();

                    using (var dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            while (dataReader.Read())
                            {
                                client.ClientId = dataReader.GetInt32("ClientId");
                                client.NickName = dataReader.GetString("NickName");
                                client.UserId = dataReader.IsDBNull("UserId") ? null : (int?)dataReader.GetInt32("UserId");
                            }
                        }
                    }

                    return client;
                }
            }
        }
    }
}
