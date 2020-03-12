using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BEFit.Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BEFit.Pages
{
    public class ViewWorkoutsModel : PageModel
    {
        public Client Client { get; set; }
        public Workout InProgressWorkout { get; set; }
        public List<Workout> CompletedWorkouts { get; set; }
        public IActionResult OnGet(int? ClientId)
        {
            if (!ClientId.HasValue)
            {
                return RedirectToPage("/Index");
            }

            BFS requestDirector = new BFS();
            Client = requestDirector.GetClientById(ClientId.Value);
            InProgressWorkout = requestDirector.GetInProgressWorkoutByClientId(Client.ClientId);
            CompletedWorkouts = requestDirector.GetCompletedWorkoutsByClientId(Client.ClientId);

            return Page();
        }
    }
}
