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
    public class ExerciseService
    {
        private string ConnectionString { get; }

        public ExerciseService()
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            ConnectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public List<ExercisePlan> GetExercisePlansByWorkoutPlanId(int WorkoutPlanId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetExercisePlansByWorkoutPlanId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    List<ExercisePlan> exercisePlans = new List<ExercisePlan>();

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
                            while (dataReader.Read())
                            {
                                ExercisePlan exercisePlan = new ExercisePlan
                                {
                                    ExercisePlanId = dataReader.GetInt32("ExercisePlanId"),
                                    WorkoutPlanId = dataReader.GetInt32("WorkoutPlanId"),
                                    Exercise = GetExerciseById(dataReader.GetInt32("ExerciseId")),
                                    Type = dataReader.GetString("Type"),
                                    Rest = dataReader.GetInt32("Rest"),
                                    Tempo = dataReader.IsDBNull("Tempo") ? null : dataReader.GetString("Tempo"),
                                    RPE = dataReader.IsDBNull("RPE") ? null : (int?)dataReader.GetInt32("RPE"),
                                    Order = dataReader.IsDBNull("Order") ? null : (int?)dataReader.GetInt32("Order"),
                                    HasSuperset = dataReader.GetBoolean("HasSuperset"),
                                    SetPlans = GetSetPlansByExercisePlanId(dataReader.GetInt32("ExercisePlanId"))
                                };
                                if (exercisePlan.HasSuperset)
                                {
                                    exercisePlan.SupersetExercise = GetSupersetExerciseByExercisePlanId(exercisePlan.ExercisePlanId);
                                }
                                exercisePlans.Add(exercisePlan);
                            }
                        }
                    }

                    return exercisePlans;
                }
            }
        }

        public List<SetPlan> GetSetPlansByExercisePlanId(int ExercisePlanId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetSetPlansByExercisePlanId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    List<SetPlan> setPlans = new List<SetPlan>();

                    SqlParameter parameter;
                    parameter = new SqlParameter
                    {
                        ParameterName = "@ExercisePlanId",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = ExercisePlanId
                    };
                    command.Parameters.Add(parameter);

                    command.Connection.Open();

                    using (var dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            while (dataReader.Read())
                            {
                                SetPlan setPlan = new SetPlan
                                {
                                    SetNumber = dataReader.GetInt32("SetNumber"),
                                    ExercisePlanId = dataReader.GetInt32("ExercisePlanId"),
                                    Weight = dataReader.GetDouble("Weight"),
                                    Reps = dataReader.IsDBNull("Reps") ? null : (int?)dataReader.GetInt32("Reps"),
                                    Time = dataReader.IsDBNull("Time") ? null : (TimeSpan?)new TimeSpan(0,0,dataReader.GetInt32("Time")),
                                    Distance = dataReader.IsDBNull("Distance") ? null : dataReader.GetString("Distance"),
                                    Interval = dataReader.IsDBNull("Interval") ? null : dataReader.GetString("Interval")
                                };
                                setPlans.Add(setPlan);
                            }
                        }
                    }

                    return setPlans;
                }
            }
        }

        public ExercisePlan GetSupersetExerciseByExercisePlanId(int ExercisePlanId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetSupersetExerciseByExercisePlanId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    ExercisePlan exercisePlan = new ExercisePlan();

                    SqlParameter parameter;
                    parameter = new SqlParameter
                    {
                        ParameterName = "@ExercisePlanId",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = ExercisePlanId
                    };
                    command.Parameters.Add(parameter);

                    command.Connection.Open();

                    using (var dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            while (dataReader.Read())
                            {
                                exercisePlan.ExercisePlanId = dataReader.GetInt32("ExercisePlanId");
                                exercisePlan.WorkoutPlanId = dataReader.GetInt32("WorkoutPlanId");
                                exercisePlan.Exercise = GetExerciseById(dataReader.GetInt32("ExerciseId"));
                                exercisePlan.Type = dataReader.GetString("Type");
                                exercisePlan.Rest = dataReader.GetInt32("Rest");
                                exercisePlan.Tempo = dataReader.IsDBNull("Tempo") ? null : dataReader.GetString("Tempo");
                                exercisePlan.RPE = dataReader.IsDBNull("RPE") ? null : (int?)dataReader.GetInt32("RPE");
                                exercisePlan.Order = dataReader.IsDBNull("Order") ? null : (int?)dataReader.GetInt32("Order");
                                exercisePlan.HasSuperset = dataReader.GetBoolean("HasSuperset");
                                exercisePlan.SetPlans = GetSetPlansByExercisePlanId(dataReader.GetInt32("ExercisePlanId"));
                            }
                        }
                    }

                    return exercisePlan;
                }
            }
        }

        public List<WorkoutExercise> GetWorkoutExercisesByWorkoutId(int WorkoutId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetWorkoutExercisesByWorkoutId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    List<WorkoutExercise> workoutExercises = new List<WorkoutExercise>();

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
                            while (dataReader.Read())
                            {
                                WorkoutExercise workoutExercise = new WorkoutExercise
                                {
                                    WorkoutExerciseId = dataReader.GetInt32("WorkoutExerciseId"),
                                    WorkoutId = dataReader.GetInt32("WorkoutId"),
                                    Exercise = GetExerciseById(dataReader.GetInt32("ExerciseId")),
                                    Type = dataReader.GetString("Type"),
                                    Rest = dataReader.GetInt32("Rest"),
                                    Tempo = dataReader.IsDBNull("Tempo") ? null : dataReader.GetString("Tempo"),
                                    RPE = dataReader.IsDBNull("RPE") ? null : (int?)dataReader.GetInt32("RPE"),
                                    Order = dataReader.IsDBNull("Order") ? null : (int?)dataReader.GetInt32("Order"),
                                    HasSuperset = dataReader.GetBoolean("HasSuperset"),
                                    ExerciseSets = GetExerciseSetsByWorkoutExerciseId(dataReader.GetInt32("WorkoutExerciseId"))
                                };
                                if (workoutExercise.HasSuperset)
                                {
                                    workoutExercise.SupersetExercise = GetSupersetExerciseByWorkoutExerciseId(workoutExercise.WorkoutExerciseId);
                                }
                                workoutExercises.Add(workoutExercise);
                            }
                        }
                    }

                    return workoutExercises;
                }
            }
        }

        public List<ExerciseSet> GetExerciseSetsByWorkoutExerciseId(int WorkoutExerciseId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetExerciseSetsByWorkoutExerciseId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    List<ExerciseSet> exerciseSets = new List<ExerciseSet>();

                    SqlParameter parameter;
                    parameter = new SqlParameter
                    {
                        ParameterName = "@WorkoutExerciseId",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = WorkoutExerciseId
                    };
                    command.Parameters.Add(parameter);

                    command.Connection.Open();

                    using (var dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            while (dataReader.Read())
                            {
                                ExerciseSet exerciseSet = new ExerciseSet
                                {
                                    SetNumber = dataReader.GetInt32("SetNumber"),
                                    WorkoutExerciseId = dataReader.GetInt32("WorkoutExerciseId"),
                                    Weight = dataReader.GetDouble("Weight"),
                                    Reps = dataReader.IsDBNull("Reps") ? null : (int?)dataReader.GetInt32("Reps"),
                                    Time = dataReader.IsDBNull("Time") ? null : (TimeSpan?)new TimeSpan(0, 0, dataReader.GetInt32("Time")),
                                    Distance = dataReader.IsDBNull("Distance") ? null : dataReader.GetString("Distance"),
                                    Interval = dataReader.IsDBNull("Interval") ? null : dataReader.GetString("Interval"),
                                    Skipped = dataReader.GetBoolean("Skipped"),
                                    Completed = dataReader.GetBoolean("Completed")
                                };
                                exerciseSets.Add(exerciseSet);
                            }
                        }
                    }

                    return exerciseSets;
                }
            }
        }

        public WorkoutExercise GetSupersetExerciseByWorkoutExerciseId(int WorkoutExerciseId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetSupersetExerciseByWorkoutExerciseId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    WorkoutExercise workoutExercise = new WorkoutExercise();

                    SqlParameter parameter;
                    parameter = new SqlParameter
                    {
                        ParameterName = "@WorkoutExerciseId",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = WorkoutExerciseId
                    };
                    command.Parameters.Add(parameter);

                    command.Connection.Open();

                    using (var dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            while (dataReader.Read())
                            {
                                workoutExercise.WorkoutExerciseId = dataReader.GetInt32("WorkoutExerciseId");
                                workoutExercise.WorkoutId = dataReader.GetInt32("WorkoutId");
                                workoutExercise.Exercise = GetExerciseById(dataReader.GetInt32("ExerciseId"));
                                workoutExercise.Type = dataReader.GetString("Type");
                                workoutExercise.Rest = dataReader.GetInt32("Rest");
                                workoutExercise.Tempo = dataReader.IsDBNull("Tempo") ? null : dataReader.GetString("Tempo");
                                workoutExercise.RPE = dataReader.IsDBNull("RPE") ? null : (int?)dataReader.GetInt32("RPE");
                                workoutExercise.Order = dataReader.IsDBNull("Order") ? null : (int?)dataReader.GetInt32("Order");
                                workoutExercise.HasSuperset = dataReader.GetBoolean("HasSuperset");
                                workoutExercise.ExerciseSets = GetExerciseSetsByWorkoutExerciseId(dataReader.GetInt32("WorkoutExerciseId"));
                            }
                        }
                    }

                    return workoutExercise;
                }
            }
        }

        public Exercise GetExerciseById(int ExerciseId)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("GetExerciseById", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    Exercise exercise = new Exercise();

                    SqlParameter parameter;
                    parameter = new SqlParameter
                    {
                        ParameterName = "@ExerciseId",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = ExerciseId
                    };
                    command.Parameters.Add(parameter);

                    command.Connection.Open();

                    using (var dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            while (dataReader.Read())
                            {
                                exercise.ExerciseId = dataReader.GetInt32("ExerciseId");
                                exercise.ExerciseName = dataReader.GetString("ExerciseName");
                                exercise.Description = dataReader.IsDBNull("Description") ? null : dataReader.GetString("Description");
                            }
                        }
                    }

                    return exercise;
                }
            }
        }

        public int AddWorkoutExercise(int WorkoutId, ExercisePlan ExercisePlan, int? WorkoutExerciseId = null)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("AddWorkoutExercise", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    SqlParameter parameter;
                    parameter = new SqlParameter
                    {
                        ParameterName = "@WorkoutId",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = WorkoutId
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@ExerciseId",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = ExercisePlan.Exercise.ExerciseId
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@Type",
                        SqlDbType = SqlDbType.VarChar,
                        Direction = ParameterDirection.Input,
                        SqlValue = ExercisePlan.Type
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@Rest",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = ExercisePlan.Rest
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@Tempo",
                        SqlDbType = SqlDbType.VarChar,
                        Direction = ParameterDirection.Input,
                        SqlValue = ExercisePlan.Tempo
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@RPE",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = ExercisePlan.RPE
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@Order",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = ExercisePlan.Order
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@HasSuperset",
                        SqlDbType = SqlDbType.Bit,
                        Direction = ParameterDirection.Input,
                        SqlValue = ExercisePlan.HasSuperset
                    };
                    command.Parameters.Add(parameter);

                    if (WorkoutExerciseId.HasValue)
                    {
                        parameter = new SqlParameter
                        {
                            ParameterName = "@SupersetId",
                            SqlDbType = SqlDbType.Int,
                            Direction = ParameterDirection.Input,
                            SqlValue = WorkoutExerciseId
                        };
                        command.Parameters.Add(parameter);
                    }

                    command.Connection.Open();

                    int workoutExerciseId = (int)command.ExecuteScalar();

                    return workoutExerciseId;
                }
            }
        }

        public void AddExerciseSet(int WorkoutExerciseId, SetPlan SetPlan)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand("AddExerciseSet", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    SqlParameter parameter;
                    parameter = new SqlParameter
                    {
                        ParameterName = "@SetNumber",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = SetPlan.SetNumber
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@WorkoutExerciseId",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = WorkoutExerciseId
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@Weight",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = SetPlan.Weight
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@Reps",
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Input,
                        SqlValue = SetPlan.Reps
                    };
                    command.Parameters.Add(parameter);

                    if (SetPlan.Time.HasValue)
                    {
                        parameter = new SqlParameter
                        {
                            ParameterName = "@Time",
                            SqlDbType = SqlDbType.Int,
                            Direction = ParameterDirection.Input,
                            SqlValue = (int)SetPlan.Time.Value.TotalSeconds
                        };
                        command.Parameters.Add(parameter);
                    }

                    parameter = new SqlParameter
                    {
                        ParameterName = "@Distance",
                        SqlDbType = SqlDbType.VarChar,
                        Direction = ParameterDirection.Input,
                        SqlValue = SetPlan.Distance
                    };
                    command.Parameters.Add(parameter);

                    parameter = new SqlParameter
                    {
                        ParameterName = "@Interval",
                        SqlDbType = SqlDbType.VarChar,
                        Direction = ParameterDirection.Input,
                        SqlValue = SetPlan.Interval
                    };
                    command.Parameters.Add(parameter);

                    command.Connection.Open();

                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
