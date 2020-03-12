CREATE OR ALTER PROCEDURE GetAllClients
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	SELECT ClientId,
		   NickName,
		   UserId
	FROM Client
	ORDER BY NickName

	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		THROW 59000,'GetAllClients - SELECT error: Client table',1

RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetClientById
	(@ClientId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @ClientId IS NULL
		THROW 50001,'GetClientById - Required parameter: @ClientId',1
	ELSE
		BEGIN
			SELECT ClientId,
				   NickName,
				   UserId
			FROM Client
			WHERE ClientId = @ClientId
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetClientById - SELECT error: Client table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetActiveWorkoutPlansByClientId
	(@ClientId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @ClientId IS NULL
		THROW 50001,'GetActiveWorkoutPlansByClientId - Required parameter: @ClientId',1
	ELSE
		BEGIN
			SELECT WorkoutPlanId,
				   ClientId,
				   WorkoutPlanName,
				   DateCreated,
				   IsActive,
				   Notes
			FROM WorkoutPlan
			WHERE ClientId = @ClientId
			AND IsActive = 1
			ORDER BY DateCreated
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetActiveWorkoutPlansByClientId - SELECT error: WorkoutPlan table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetInactiveWorkoutPlansByClientId
	(@ClientId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @ClientId IS NULL
		THROW 50001,'GetInactiveWorkoutPlansByClientId - Required parameter: @ClientId',1
	ELSE
		BEGIN
			SELECT WorkoutPlanId,
				   ClientId,
				   WorkoutPlanName,
				   DateCreated,
				   IsActive,
				   Notes
			FROM WorkoutPlan
			WHERE ClientId = @ClientId
			AND IsActive = 0
			ORDER BY DateCreated
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetInactiveWorkoutPlansByClientId - SELECT error: WorkoutPlan table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetWorkoutPlanById
	(@WorkoutPlanId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @WorkoutPlanId IS NULL
		THROW 50001,'GetWorkoutPlanById - Required parameter: @WorkoutPlanId',1
	ELSE
		BEGIN
			SELECT WorkoutPlanId,
				   ClientId,
				   WorkoutPlanName,
				   DateCreated,
				   IsActive,
				   Notes
			FROM WorkoutPlan
			WHERE WorkoutPlanId = @WorkoutPlanId
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetWorkoutPlanById - SELECT error: WorkoutPlan table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetExercisePlansByWorkoutPlanId
	(@WorkoutPlanId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @WorkoutPlanId IS NULL
		THROW 50001,'GetExercisePlansByWorkoutPlanId - Required parameter: @WorkoutPlanId',1
	ELSE
		BEGIN
			SELECT ExercisePlanId,
				   WorkoutPlanId,
				   ExerciseId,
				   Type,
				   Rest,
				   Tempo,
				   RPE,
				   [Order],
				   HasSuperset
			FROM ExercisePlan
			WHERE WorkoutPlanId = @WorkoutPlanId
			AND SupersetId IS NULL
			ORDER BY [Order]
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetExercisePlansByWorkoutPlanId - SELECT error: ExercisePlan table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetSetPlansByExercisePlanId
	(@ExercisePlanId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @ExercisePlanId IS NULL
		THROW 50001,'GetSetPlansByExercisePlanId - Required parameter: @ExercisePlanId',1
	ELSE
		BEGIN
			SELECT SetNumber,
				   ExercisePlanId,
				   Weight,
				   Reps,
				   [Time],
				   Distance,
				   Interval
			FROM SetPlan
			WHERE ExercisePlanId = @ExercisePlanId
			ORDER BY SetNumber
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetSetPlansByExercisePlanId - SELECT error: SetPlan table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetInProgressWorkoutByClientId
	(@ClientId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @ClientId IS NULL
		THROW 50001,'GetInProgressWorkoutByClientId - Required parameter: @ClientId',1
	ELSE
		BEGIN
			SELECT WorkoutId,
				   ClientId,
				   WorkoutName,
				   DateStarted,
				   DateCompleted,
				   Notes
			FROM Workout
			WHERE ClientId = @ClientId
			AND DateCompleted IS NULL
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetInProgressWorkoutByClientId - SELECT error: Workout table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetCompletedWorkoutsByClientId
	(@ClientId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @ClientId IS NULL
		THROW 50001,'GetCompletedWorkoutsByClientId - Required parameter: @ClientId',1
	ELSE
		BEGIN
			SELECT WorkoutId,
				   ClientId,
				   WorkoutName,
				   DateStarted,
				   DateCompleted,
				   Notes
			FROM Workout
			WHERE ClientId = @ClientId
			AND DateCompleted IS NOT NULL
			ORDER BY DateCompleted
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetCompletedWorkoutsByClientId - SELECT error: Workout table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetWorkoutById
	(@WorkoutId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @WorkoutId IS NULL
		THROW 50001,'GetWorkoutById - Required parameter: @WorkoutId',1
	ELSE
		BEGIN
			SELECT WorkoutId,
				   ClientId,
				   WorkoutName,
				   DateStarted,
				   DateCompleted,
				   Notes
			FROM Workout
			WHERE WorkoutId = @WorkoutId
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetWorkoutById - SELECT error: Workout table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetWorkoutExercisesByWorkoutId
	(@WorkoutId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @WorkoutId IS NULL
		THROW 50001,'GetWorkoutExercisesByWorkoutId - Required parameter: @WorkoutId',1
	ELSE
		BEGIN
			SELECT WorkoutExerciseId,
				   WorkoutId,
				   ExerciseId,
				   Type,
				   Rest,
				   Tempo,
				   RPE,
				   [Order],
				   HasSuperset
			FROM WorkoutExercise
			WHERE WorkoutId = @WorkoutId
			AND SupersetId IS NULL
			ORDER BY [Order]
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetWorkoutExercisesByWorkoutId - SELECT error: WorkoutExercise table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetExerciseSetsByWorkoutExerciseId
	(@WorkoutExerciseId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @WorkoutExerciseId IS NULL
		THROW 50001,'GetExerciseSetsByWorkoutExerciseId - Required parameter: @WorkoutExerciseId',1
	ELSE
		BEGIN
			SELECT SetNumber,
				   WorkoutExerciseId,
				   Weight,
				   Reps,
				   [Time],
				   Distance,
				   Interval,
				   Skipped,
				   Completed
			FROM ExerciseSet
			WHERE WorkoutExerciseId = @WorkoutExerciseId
			ORDER BY SetNumber
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetExerciseSetsByWorkoutExerciseId - SELECT error: ExerciseSet table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetSupersetExerciseByExercisePlanId
	(@ExercisePlanId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @ExercisePlanId IS NULL
		THROW 50001,'GetSupersetExerciseByExercisePlanId - Required parameter: @ExercisePlanId',1
	ELSE
		BEGIN
			SELECT ExercisePlanId,
				   WorkoutPlanId,
				   ExerciseId,
				   Type,
				   Rest,
				   Tempo,
				   RPE,
				   [Order],
				   HasSuperset
			FROM ExercisePlan
			WHERE SupersetId = @ExercisePlanId
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetSupersetExerciseByExercisePlanId - SELECT error: ExercisePlan table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetSupersetExerciseByWorkoutExerciseId
	(@WorkoutExerciseId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @WorkoutExerciseId IS NULL
		THROW 50001,'GetSupersetExerciseByWorkoutExerciseId - Required parameter: @WorkoutExerciseId',1
	ELSE
		BEGIN
			SELECT WorkoutExerciseId,
				   WorkoutId,
				   ExerciseId,
				   Type,
				   Rest,
				   Tempo,
				   RPE,
				   [Order],
				   HasSuperset
			FROM WorkoutExercise
			WHERE SupersetId = @WorkoutExerciseId
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetSupersetExerciseByWorkoutExerciseId - SELECT error: WorkoutExercise table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE GetExerciseById
	(@ExerciseId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @ExerciseId IS NULL
		THROW 50001,'GetExerciseById - Required parameter: @ExerciseId',1
	ELSE
		BEGIN
			SELECT ExerciseId,
				   ExerciseName,
				   Description
			FROM Exercise
			WHERE ExerciseId = @ExerciseId
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'GetExerciseById - SELECT error: Exercise table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE AddWorkout
	(@ClientId INT = NULL,
	 @WorkoutName VARCHAR(30) = NULL,
	 @DateStarted DATE = NULL,
	 @DateCompleted DATE = NULL,
	 @Notes VARCHAR(MAX) = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @ClientId IS NULL
		THROW 50001,'AddWorkout - Required parameter: @ClientId',1
	ELSE IF @WorkoutName IS NULL
		THROW 50001,'AddWorkout - Required parameter: @WorkoutName',1
	ELSE IF @DateStarted IS NULL
		THROW 50001,'AddWorkout - Required parameter: @DateStarted',1
	ELSE
		BEGIN
			INSERT INTO Workout
				(ClientId, WorkoutName, DateStarted, DateCompleted, Notes)
			OUTPUT inserted.WorkoutId
			VALUES
				(@ClientId, @WorkoutName, @DateStarted, @DateCompleted, @Notes)
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'AddWorkout - INSERT error: Workout table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE AddWorkoutExercise
	(@WorkoutId INT = NULL,
	 @ExerciseId INT = NULL,
	 @Type VARCHAR(15) = NULL,
	 @Rest INT = NULL,
	 @Tempo VARCHAR(8) = NULL,
	 @RPE INT = NULL,
	 @Order INT = NULL,
	 @HasSuperset BIT = NULL,
	 @SupersetId INT = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @WorkoutId IS NULL
		THROW 50001,'AddWorkoutExercise - Required parameter: @WorkoutId',1
	ELSE IF @ExerciseId IS NULL
		THROW 50001,'AddWorkoutExercise - Required parameter: @ExerciseId',1
	ELSE IF @Type IS NULL
		THROW 50001,'AddWorkoutExercise - Required parameter: @Type',1
	ELSE IF @Rest IS NULL
		THROW 50001,'AddWorkoutExercise - Required parameter: @Rest',1
	ELSE IF @HasSuperset IS NULL
		THROW 50001,'AddWorkoutExercise - Required parameter: @HasSuperset',1
	ELSE
		BEGIN
			INSERT INTO WorkoutExercise
				(WorkoutId, ExerciseId, Type, Rest, Tempo, RPE, [Order], HasSuperset, SupersetId)
			OUTPUT inserted.WorkoutExerciseId
			VALUES
				(@WorkoutId, @ExerciseId, @Type, @Rest, @Tempo, @RPE, @Order, @HasSuperset, @SupersetId)
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'AddWorkoutExercise - INSERT error: WorkoutExercise table',1

	RETURN @ReturnCode
GO

CREATE OR ALTER PROCEDURE AddExerciseSet
	(@SetNumber INT = NULL,
	 @WorkoutExerciseId INT = NULL,
	 @Weight FLOAT = NULL,
	 @Reps INT = NULL,
	 @Time INT = NULL,
	 @Distance VARCHAR(30) = NULL,
	 @Interval VARCHAR(14) = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @SetNumber IS NULL
		THROW 50001,'AddExerciseSet - Required parameter: @SetNumber',1
	ELSE IF @WorkoutExerciseId IS NULL
		THROW 50001,'AddExerciseSet - Required parameter: @WorkoutExerciseId',1
	ELSE IF @Weight IS NULL
		THROW 50001,'AddExerciseSet - Required parameter: @Weight',1
	ELSE
		BEGIN
			INSERT INTO ExerciseSet
				(SetNumber, WorkoutExerciseId, Weight, Reps, Time, Distance, Interval)
			VALUES
				(@SetNumber, @WorkoutExerciseId, @Weight, @Reps, @Time, @Distance, @Interval)
		END

		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			THROW 59000,'AddExerciseSet - INSERT error: ExerciseSet table',1

	RETURN @ReturnCode
GO
