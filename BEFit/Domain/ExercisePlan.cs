using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BEFit.Domain
{
    public class ExercisePlan
    {
        public int ExercisePlanId { get; set; }
        public int WorkoutPlanId { get; set; }
        public Exercise Exercise { get; set; }
        public string Type { get; set; }
        public int Rest { get; set; }
        public string Tempo { get; set; }
        public int? RPE { get; set; }
        public int? Order { get; set; }
        public bool HasSuperset { get; set; }
        public List<SetPlan> SetPlans { get; set; }
        public ExercisePlan SupersetExercise { get; set; }
    }
}
