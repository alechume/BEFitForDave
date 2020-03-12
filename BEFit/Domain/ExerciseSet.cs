using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BEFit.Domain
{
    public class ExerciseSet
    {
        public int SetNumber { get; set; }
        public int WorkoutExerciseId { get; set; }
        public double Weight { get; set; }
        public int? Reps { get; set; }
        public TimeSpan? Time { get; set; }
        public string Distance { get; set; }
        public string Interval { get; set; }
        public bool Skipped { get; set; }
        public bool Completed { get; set; }
    }
}
