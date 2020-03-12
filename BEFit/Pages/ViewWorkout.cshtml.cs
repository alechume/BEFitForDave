using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BEFit.Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BEFit.Pages
{
    public class ViewWorkoutModel : PageModel
    {
        public Client Client { get; set; }
        public Workout Workout { get; set; }
        public IActionResult OnGet(int? ClientId, int? WorkoutId)
        {
            if (!ClientId.HasValue)
            {
                return RedirectToPage("/Index");
            }
            else if (!WorkoutId.HasValue)
            {
                return RedirectToPage("/ViewClient", new { ClientId });
            }

            BFS requestDirector = new BFS();
            Client = requestDirector.GetClientById(ClientId.Value);
            Workout = requestDirector.GetWorkoutById(WorkoutId.Value);

            return Page();
        }
    }
}
