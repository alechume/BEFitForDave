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
    public class WorkoutService
    {
        private string ConnectionString { get; }

        public WorkoutService()
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            ConnectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public List<WorkoutPlan> GetActiveWorkoutPlansByClientId(int ClientId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetActiveWorkoutPlansByClientId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    List<WorkoutPlan> workoutPlans = new List<WorkoutPlan>();

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
                                WorkoutPlan workoutPlan = new WorkoutPlan
                                {
                                    WorkoutPlanId = dataReader.GetInt32("WorkoutPlanId"),
                                    ClientId = dataReader.GetInt32("ClientId"),
                                    WorkoutPlanName = dataReader.GetString("WorkoutPlanName"),
                                    DateCreated = dataReader.GetDateTime("DateCreated"),
                                    IsActive = dataReader.GetBoolean("IsActive"),
                                    Notes = dataReader.IsDBNull("Notes") ? null : dataReader.GetString("Notes")
                                };
                                workoutPlans.Add(workoutPlan);
                            }
                        }
                    }

                    return workoutPlans;
                }
            }
        }

        public List<WorkoutPlan> GetInactiveWorkoutPlansByClientId(int ClientId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetInactiveWorkoutPlansByClientId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    List<WorkoutPlan> workoutPlans = new List<WorkoutPlan>();

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
                                WorkoutPlan workoutPlan = new WorkoutPlan
                                {
                                    WorkoutPlanId = dataReader.GetInt32("WorkoutPlanId"),
                                    ClientId = dataReader.GetInt32("ClientId"),
                                    WorkoutPlanName = dataReader.GetString("WorkoutPlanName"),
                                    DateCreated = dataReader.GetDateTime("DateCreated"),
                                    IsActive = dataReader.GetBoolean("IsActive"),
                                    Notes = dataReader.IsDBNull("Notes") ? null : dataReader.GetString("Notes")
                                };
                                workoutPlans.Add(workoutPlan);
                            }
                        }
                    }

                    return workoutPlans;
                }
            }
        }

        public WorkoutPlan GetWorkoutPlanById(int WorkoutPlanId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetWorkoutPlanById", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    WorkoutPlan workoutPlan = new WorkoutPlan();

                    SqlParameter parameter;
                    parameter = new SqlParameter
                    {
                        ParameterName = "@WorkoutPlanId",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = WorkoutPlanId
                    };
                    command.Parameters.Add(parameter);

                    command.Connection.Open();

                    using (var dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            ExerciseService exerciseManager = new ExerciseService();
                            while (dataReader.Read())
                            {
                                workoutPlan.WorkoutPlanId = dataReader.GetInt32("WorkoutPlanId");
                                workoutPlan.ClientId = dataReader.GetInt32("ClientId");
                                workoutPlan.WorkoutPlanName = dataReader.GetString("WorkoutPlanName");
                                workoutPlan.DateCreated = dataReader.GetDateTime("DateCreated");
                                workoutPlan.IsActive = dataReader.GetBoolean("IsActive");
                                workoutPlan.Notes = dataReader.IsDBNull("Notes") ? null : dataReader.GetString("Notes");
                                workoutPlan.ExercisePlans = exerciseManager.GetExercisePlansByWorkoutPlanId(dataReader.GetInt32("WorkoutPlanId"));
                            }
                        }
                    }

                    return workoutPlan;
                }
            }
        }

        public Workout GetInProgressWorkoutByClientId(int ClientId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetInProgressWorkoutByClientId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    Workout workout = new Workout();

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
                                workout.WorkoutId = dataReader.GetInt32("WorkoutId");
                                workout.ClientId = dataReader.GetInt32("ClientId");
                                workout.WorkoutName = dataReader.GetString("WorkoutName");
                                workout.DateStarted = dataReader.GetDateTime("DateStarted");
                                workout.DateCompleted = dataReader.IsDBNull("DateCompleted") ? null : (DateTime?)dataReader.GetDateTime("DateCompleted");
                                workout.Notes = dataReader.IsDBNull("Notes") ? null : dataReader.GetString("Notes");
                            }
                        }
                    }

                    return workout;
                }
            }
        }

        public List<Workout> GetCompletedWorkoutsByClientId(int ClientId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetCompletedWorkoutsByClientId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    List<Workout> workouts = new List<Workout>();

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
                                Workout workout = new Workout
                                {
                                    WorkoutId = dataReader.GetInt32("WorkoutId"),
                                    ClientId = dataReader.GetInt32("ClientId"),
                                    WorkoutName = dataReader.GetString("WorkoutName"),
                                    DateStarted = dataReader.GetDateTime("DateStarted"),
                                    DateCompleted = dataReader.IsDBNull("DateCompleted") ? null : (DateTime?)dataReader.GetDateTime("DateCompleted"),
                                    Notes = dataReader.IsDBNull("Notes") ? null : dataReader.GetString("Notes")
                                };
                                workouts.Add(workout);
                            }
                        }
                    }

                    return workouts;
                }
            }
        }

        public Workout GetWorkoutById(int WorkoutId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetWorkoutById", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    Workout workout = new Workout();

                    SqlParameter parameter;
                    parameter = new SqlParameter
                    {
                        ParameterName = "@WorkoutId",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = WorkoutId
                    };
                    command.Parameters.Add(parameter);

                    command.Connection.Open();

                    using (var dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            ExerciseService exerciseManager = new ExerciseService();
                            while (dataReader.Read())
                            {
                                workout.WorkoutId = dataReader.GetInt32("WorkoutId");
                                workout.ClientId = dataReader.GetInt32("ClientId");
                                workout.WorkoutName = dataReader.GetString("WorkoutName");
                                workout.DateStarted = dataReader.GetDateTime("DateStarted");
                                workout.DateCompleted = dataReader.IsDBNull("DateCompleted") ? null : (DateTime?)dataReader.GetDateTime("DateCompleted");
                                workout.Notes = dataReader.IsDBNull("Notes") ? null : dataReader.GetString("Notes");
                                workout.WorkoutExercises = exerciseManager.GetWorkoutExercisesByWorkoutId(dataReader.GetInt32("WorkoutId"));
                            }
                        }
                    }

                    return workout;
                }
            }
        }

        public int StartWorkout(WorkoutPlan WorkoutPlan)
        {
            int workoutId = AddWorkout(WorkoutPlan);

            ExerciseService exerciseManager = new ExerciseService();
            foreach (ExercisePlan exercisePlan in WorkoutPlan.ExercisePlans)
            {
                int workoutExerciseId = exerciseManager.AddWorkoutExercise(workoutId, exercisePlan);
                foreach (SetPlan setPlan in exercisePlan.SetPlans)
                {
                    exerciseManager.AddExerciseSet(workoutExerciseId, setPlan);
                }
                if (exercisePlan.SupersetExercise != null)
                {
                    int supersetWorkoutExerciseId = exerciseManager.AddWorkoutExercise(workoutId, exercisePlan.SupersetExercise, workoutExerciseId);
                    foreach (SetPlan setPlan in exercisePlan.SupersetExercise.SetPlans)
                    {
                        exerciseManager.AddExerciseSet(supersetWorkoutExerciseId, setPlan);
                    }
                }
            }
            return workoutId;
        }

        public int AddWorkout(WorkoutPlan WorkoutPlan)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("AddWorkout", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    SqlParameter parameter;
                    parameter = new SqlParameter
                    {
                        ParameterName = "@ClientId",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = WorkoutPlan.ClientId
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@WorkoutName",
                        SqlDbType = SqlDbType.VarChar,
                        Direction = ParameterDirection.Input,
                        SqlValue = WorkoutPlan.WorkoutPlanName
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@DateStarted",
                        SqlDbType = SqlDbType.Date,
                        Direction = ParameterDirection.Input,
                        SqlValue = DateTime.Now.Date
                    };
                    command.Parameters.Add(parameter);

                    command.Connection.Open();

                    int workoutId = (int)command.ExecuteScalar();

                    return workoutId;
                }
            }
        }
    }
}
