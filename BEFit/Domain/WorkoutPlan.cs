using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BEFit.Domain
{
    public class WorkoutPlan
    {
        public int WorkoutPlanId { get; set; }
        public int ClientId { get; set; }
        public string WorkoutPlanName { get; set; }
        public DateTime DateCreated { get; set; }
        public bool IsActive { get; set; }
        public string Notes { get; set; }
        public List<ExercisePlan> ExercisePlans { get; set; }
    }
}
