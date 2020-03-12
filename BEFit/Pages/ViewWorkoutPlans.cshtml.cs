using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BEFit.Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BEFit.Pages
{
    public class ViewWorkoutPlansModel : PageModel
    {
        public Client Client { get; set; }
        public List<WorkoutPlan> ActiveWorkoutPlans { get; set; }
        public List<WorkoutPlan> InactiveWorkoutPlans { get; set; }
        public string ErrorString { get; set; }
        [BindProperty]
        public string Submit { get; set; }
        [BindProperty]
        public int WorkoutPlanId { get; set; }
        public IActionResult OnGet(int? ClientId)
        {
            if (!ClientId.HasValue)
            {
                return RedirectToPage("/Index");
            }

            BFS requestDirector = new BFS();
            Client = requestDirector.GetClientById(ClientId.Value);
            ActiveWorkoutPlans = requestDirector.GetActiveWorkoutPlansByClientId(Client.ClientId);
            InactiveWorkoutPlans = requestDirector.GetInactiveWorkoutPlansByClientId(Client.ClientId);

            return Page();
        }

        public IActionResult OnPost(int? ClientId)
        {
            if (!ClientId.HasValue)
            {
                return RedirectToPage("/Index");
            }

            BFS requestDirector = new BFS();
            Client = requestDirector.GetClientById(ClientId.Value);
            ActiveWorkoutPlans = requestDirector.GetActiveWorkoutPlansByClientId(Client.ClientId);
            InactiveWorkoutPlans = requestDirector.GetInactiveWorkoutPlansByClientId(Client.ClientId);

            if (Submit.Equals("SubmitStartWorkout"))
            {
                Workout inProgressWorkout = requestDirector.GetInProgressWorkoutByClientId(Client.ClientId);
                if (inProgressWorkout.WorkoutName == null)
                {
                    WorkoutPlan workoutPlan = requestDirector.GetWorkoutPlanById(WorkoutPlanId);
                    int workoutId = requestDirector.StartWorkout(workoutPlan);
                }
                else
                {
                    ErrorString = "You already have a workout in progress";
                }
                
            }

            return Page();
        }
    }
}
