using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BEFit.Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BEFit.Pages
{
    public class ViewWorkoutPlanModel : PageModel
    {
        public Client Client { get; set; }
        public WorkoutPlan WorkoutPlan { get; set; }
        public string ErrorString { get; set; }
        [BindProperty]
        public string Submit { get; set; }
        public IActionResult OnGet(int? ClientId, int? WorkoutPlanId)
        {
            if (!ClientId.HasValue)
            {
                return RedirectToPage("/Index");
            }
            else if (!WorkoutPlanId.HasValue)
            {
                return RedirectToPage("/ViewClient", new { ClientId });
            }

            BFS requestDirector = new BFS();
            Client = requestDirector.GetClientById(ClientId.Value);
            WorkoutPlan = requestDirector.GetWorkoutPlanById(WorkoutPlanId.Value);

            return Page();
        }

        public IActionResult OnPost(int? ClientId, int? WorkoutPlanId)
        {
            if (!ClientId.HasValue)
            {
                return RedirectToPage("/Index");
            }
            else if (!WorkoutPlanId.HasValue)
            {
                return RedirectToPage("/ViewClient", new { ClientId });
            }

            BFS requestDirector = new BFS();
            Client = requestDirector.GetClientById(ClientId.Value);
            WorkoutPlan = requestDirector.GetWorkoutPlanById(WorkoutPlanId.Value);

            if (Submit.Equals("SubmitStartWorkout"))
            {
                Workout inProgressWorkout = requestDirector.GetInProgressWorkoutByClientId(Client.ClientId);
                if (inProgressWorkout.WorkoutName == null)
                {
                    int workoutId = requestDirector.StartWorkout(WorkoutPlan);
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
