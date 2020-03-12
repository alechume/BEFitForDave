using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BEFit.Domain
{
    public class SetPlan
    {
        public int SetNumber { get; set; }
        public int ExercisePlanId { get; set; }
        public double Weight { get; set; }
        public int? Reps { get; set; }
        public TimeSpan? Time { get; set; }
        public string Distance { get; set; }
        public string Interval { get; set; }
    }
}
