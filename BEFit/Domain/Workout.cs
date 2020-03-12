using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BEFit.Domain
{
    public class Workout
    {
        public int WorkoutId { get; set; }
        public int ClientId { get; set; }
        public string WorkoutName { get; set; }
        public DateTime DateStarted { get; set; }
        public DateTime? DateCompleted { get; set; }
        public string Notes { get; set; }
        public List<WorkoutExercise> WorkoutExercises { get; set; }
    }
}
