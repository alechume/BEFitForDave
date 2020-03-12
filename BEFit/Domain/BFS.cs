using BEFit.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BEFit.Domain
{
    public class BFS
    {
        public List<WorkoutPlan> GetActiveWorkoutPlansByClientId(int ClientId)
        {
            WorkoutService workoutManager = new WorkoutService();
            List<WorkoutPlan> workoutPlans = workoutManager.GetActiveWorkoutPlansByClientId(ClientId);
            return workoutPlans;
        }

        public List<Client> GetAllClients()
        {
            ClientService clientManager = new ClientService();
            List<Client> clients = clientManager.GetAllClients();
            return clients;
        }

        public Client GetClientById(int ClientId)
        {
            ClientService clientManager = new ClientService();
            Client client = clientManager.GetClientById(ClientId);
            return client;
        }

        public List<Workout> GetCompletedWorkoutsByClientId(int ClientId)
        {
            WorkoutService workoutManager = new WorkoutService();
            List<Workout> workouts = workoutManager.GetCompletedWorkoutsByClientId(ClientId);
            return workouts;
        }

        public List<WorkoutPlan> GetInactiveWorkoutPlansByClientId(int ClientId)
        {
            WorkoutService workoutManager = new WorkoutService();
            List<WorkoutPlan> workoutPlans = workoutManager.GetInactiveWorkoutPlansByClientId(ClientId);
            return workoutPlans;
        }

        public Workout GetInProgressWorkoutByClientId(int ClientId)
        {
            WorkoutService workoutManager = new WorkoutService();
            Workout workout = workoutManager.GetInProgressWorkoutByClientId(ClientId);
            return workout;
        }

        public Workout GetWorkoutById(int WorkoutId)
        {
            WorkoutService workoutManager = new WorkoutService();
            Workout workout = workoutManager.GetWorkoutById(WorkoutId);
            return workout;
        }

        public WorkoutPlan GetWorkoutPlanById(int WorkoutPlanId)
        {
            WorkoutService workoutManager = new WorkoutService();
            WorkoutPlan workoutPlan = workoutManager.GetWorkoutPlanById(WorkoutPlanId);
            return workoutPlan;
        }

        public int StartWorkout(WorkoutPlan WorkoutPlan)
        {
            WorkoutService workoutManager = new WorkoutService();
            int workoutId = workoutManager.StartWorkout(WorkoutPlan);
            return workoutId;
        }
    }
}
