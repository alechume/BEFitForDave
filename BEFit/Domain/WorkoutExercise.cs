using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BEFit.Domain
{
    public class WorkoutExercise
    {
        public int WorkoutExerciseId { get; set; }
        public int WorkoutId { get; set; }
        public Exercise Exercise { get; set; }
        public string Type { get; set; }
        public int Rest { get; set; }
        public string Tempo { get; set; }
        public int? RPE { get; set; }
        public int? Order { get; set; }
        public bool HasSuperset { get; set; }
        public List<ExerciseSet> ExerciseSets { get; set; }
        public WorkoutExercise SupersetExercise { get; set; }
    }
}
