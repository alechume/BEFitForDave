using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BEFit.Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BEFit.Pages
{
    public class ViewClientModel : PageModel
    {
        public Client Client { get; set; }
        public List<WorkoutPlan> ActiveWorkoutPlans { get; set; }
        public IActionResult OnGet(int? ClientId)
        {
            if (!ClientId.HasValue)
            {
                return RedirectToPage("/Index");
            }

            BFS requestDirector = new BFS();
            Client = requestDirector.GetClientById(ClientId.Value);
            ActiveWorkoutPlans = requestDirector.GetActiveWorkoutPlansByClientId(Client.ClientId);

            return Page();
        }
    }
}
