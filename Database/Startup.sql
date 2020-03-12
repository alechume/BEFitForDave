--CREATE DATABASE BEFitDB

CREATE TABLE [User]
(
	UserId INT IDENTITY(1,1) NOT NULL,
	Email NVARCHAR(256) UNIQUE NOT NULL
)
ALTER TABLE [User]
	ADD
		CONSTRAINT PK_User PRIMARY KEY (UserId),
		CONSTRAINT CK_User_UserId CHECK (UserId > 0)

CREATE TABLE Client
(
	ClientId INT IDENTITY(1,1) NOT NULL,
	NickName NVARCHAR(20) UNIQUE NOT NULL,
	UserId INT NULL
)
ALTER TABLE Client
	ADD
		CONSTRAINT PK_Client PRIMARY KEY (ClientId),
		CONSTRAINT FK_Client_User FOREIGN KEY (UserId) REFERENCES [User](UserId),
		CONSTRAINT CK_Client_ClientId CHECK (ClientId > 0),
		CONSTRAINT CK_Client_UserId CHECK (UserId > 0)

CREATE TABLE Exercise
(
	ExerciseId INT IDENTITY(1,1) NOT NULL,
	ExerciseName VARCHAR(30) UNIQUE NOT NULL,
	Description VARCHAR(MAX) NULL
)
ALTER TABLE Exercise
	ADD
		CONSTRAINT PK_Exercise PRIMARY KEY (ExerciseId),
		CONSTRAINT CK_Exercise_ExerciseId CHECK (ExerciseId > 0)

CREATE TABLE Category
(
	CategoryId INT IDENTITY(1,1) NOT NULL,
	CategoryName VARCHAR(30) UNIQUE NOT NULL,
	Description VARCHAR(MAX) NULL
)
ALTER TABLE Category
	ADD
		CONSTRAINT PK_Category PRIMARY KEY (CategoryId),
		CONSTRAINT CK_Category_CategoryId CHECK (CategoryId > 0)

CREATE TABLE ExerciseCategory
(
	ExerciseId INT NOT NULL,
	CategoryId INT NOT NULL
)
ALTER TABLE ExerciseCategory
	ADD
		CONSTRAINT PK_ExerciseCategory PRIMARY KEY (ExerciseId,CategoryId),
		CONSTRAINT FK_ExerciseCategory_Exercise FOREIGN KEY (ExerciseId) REFERENCES Exercise(ExerciseId),
		CONSTRAINT FK_ExerciseCategory_Category FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)

CREATE TABLE WorkoutPlan
(
	WorkoutPlanId INT IDENTITY(1,1) NOT NULL,
	ClientId INT NOT NULL,
	WorkoutPlanName VARCHAR(30) NOT NULL,
	DateCreated DATE NOT NULL,
	IsActive BIT DEFAULT 1 NOT NULL,
	Notes VARCHAR(MAX) NULL
)
ALTER TABLE WorkoutPlan
	ADD
		CONSTRAINT PK_WorkoutPlan PRIMARY KEY (WorkoutPlanId),
		CONSTRAINT FK_WorkoutPlan_Client FOREIGN KEY (ClientId) REFERENCES Client(ClientId),
		CONSTRAINT CK_WorkoutPlan_WorkoutPlanId CHECK (WorkoutPlanId > 0),
		CONSTRAINT CK_WorkoutPlan_ClientID CHECK (ClientId > 0)

CREATE TABLE ExercisePlan
(
	ExercisePlanId INT IDENTITY(1,1) NOT NULL,
	WorkoutPlanId INT NOT NULL,
	ExerciseId INT NOT NULL,
	Type VARCHAR(15) NOT NULL,
	Rest INT NOT NULL,
	Tempo VARCHAR(8) NULL,
	RPE INT NULL,
	[Order] INT NULL,
	HasSuperset BIT DEFAULT 0 NOT NULL,
	SupersetId INT NULL
)
ALTER TABLE ExercisePlan
	ADD
		CONSTRAINT PK_ExercisePlan PRIMARY KEY (ExercisePlanId),
		CONSTRAINT FK_ExercisePlan_WorkoutPlan FOREIGN KEY (WorkoutPlanId) REFERENCES WorkoutPlan(WorkoutPlanId),
		CONSTRAINT FK_ExercisePlan_Exercise FOREIGN KEY (ExerciseId) REFERENCES Exercise(ExerciseId),
		CONSTRAINT CK_ExercisePlan_ExercisePlanId CHECK (ExercisePlanId > 0),
		CONSTRAINT CK_ExercisePlan_WorkoutPlanId CHECK (WorkoutPlanId > 0),
		CONSTRAINT CK_ExercisePlan_ExerciseId CHECK (ExerciseId > 0),
		CONSTRAINT CK_ExercisePlan_Rest CHECK (Rest >= 0),
		CONSTRAINT CK_ExercisePlan_RPE CHECK (RPE >= 0 AND RPE <= 10),
		CONSTRAINT CK_ExercisePlan_Order CHECK ([Order] >= 0),
		CONSTRAINT CK_ExercisePlan_SupersetId CHECK (SupersetId > 0)

CREATE TABLE SetPlan
(
	SetNumber INT NOT NULL,
	ExercisePlanId INT NOT NULL,
	Weight FLOAT DEFAULT 0 NOT NULL,
	Reps INT NULL,
	[Time] INT NULL,
	Distance VARCHAR(30) NULL,
	Interval VARCHAR(14) NULL
)
ALTER TABLE SetPlan
	ADD
		CONSTRAINT PK_SetPlan PRIMARY KEY (SetNumber,ExercisePlanId),
		CONSTRAINT FK_SetPlan_ExercisePlan FOREIGN KEY (ExercisePlanId) REFERENCES ExercisePlan(ExercisePlanId),
		CONSTRAINT CK_SetPlan_SetNumber CHECK (SetNumber > 0),
		CONSTRAINT CK_SetPlan_Weight CHECK (Weight >= 0.0),
		CONSTRAINT CK_SetPlan_Reps CHECK (Reps >= 0),
		CONSTRAINT CK_SetPlan_Time CHECK ([Time] >= 0)

CREATE TABLE Workout
(
	WorkoutId INT IDENTITY(1,1) NOT NULL,
	ClientId INT NOT NULL,
	WorkoutName VARCHAR(30) NOT NULL,
	DateStarted DATE NOT NULL,
	DateCompleted DATE NULL,
	Notes VARCHAR(MAX) NULL
)
ALTER TABLE Workout
	ADD
		CONSTRAINT PK_Workout PRIMARY KEY (WorkoutId),
		CONSTRAINT FK_Workout_Client FOREIGN KEY (ClientId) REFERENCES Client(ClientId),
		CONSTRAINT CK_Workout_WorkoutId CHECK (WorkoutId > 0),
		CONSTRAINT CK_Workout_ClientId CHECK (ClientId > 0)

CREATE TABLE WorkoutExercise
(
	WorkoutExerciseId INT IDENTITY(1,1) NOT NULL,
	WorkoutId INT NOT NULL,
	ExerciseId INT NOT NULL,
	Type VARCHAR(15) NOT NULL,
	Rest INT NOT NULL,
	Tempo VARCHAR(8) NULL,
	RPE INT NULL,
	[Order] INT NULL,
	HasSuperset BIT DEFAULT 0 NOT NULL,
	SupersetId INT NULL
)
ALTER TABLE WorkoutExercise
	ADD
		CONSTRAINT PK_WorkoutExercise PRIMARY KEY (WorkoutExerciseId),
		CONSTRAINT FK_WorkoutExercise_Workout FOREIGN KEY (WorkoutId) REFERENCES Workout(WorkoutId),
		CONSTRAINT FK_WorkoutExercise_Exercise FOREIGN KEY (ExerciseId) REFERENCES Exercise(ExerciseId),
		CONSTRAINT CK_WorkoutExercise_WorkoutExerciseId CHECK (WorkoutExerciseId > 0),
		CONSTRAINT CK_WorkoutExercise_WorkoutId CHECK (WorkoutId > 0),
		CONSTRAINT CK_WorkoutExercise_ExerciseId CHECK (ExerciseId > 0),
		CONSTRAINT CK_WorkoutExercise_Rest CHECK (Rest >= 0),
		CONSTRAINT CK_WorkoutExercise_RPE CHECK (RPE >= 0 AND RPE <= 10),
		CONSTRAINT CK_WorkoutExercise_Order CHECK ([Order] >= 0),
		CONSTRAINT CK_WorkoutExercise_SupersetId CHECK (SupersetId > 0)

CREATE TABLE ExerciseSet
(
	SetNumber INT NOT NULL,
	WorkoutExerciseId INT NOT NULL,
	Weight FLOAT NOT NULL,
	Reps INT NULL,
	[Time] INT NULL,
	Distance VARCHAR(30) NULL,
	Interval VARCHAR(14) NULL,
	Skipped BIT DEFAULT 0 NOT NULL,
	Completed BIT DEFAULT 0 NOT NULL
)
ALTER TABLE ExerciseSet
	ADD
		CONSTRAINT PK_ExerciseSet PRIMARY KEY (SetNumber,WorkoutExerciseId),
		CONSTRAINT FK_ExerciseSet_WorkoutExercise FOREIGN KEY (WorkoutExerciseId) REFERENCES WorkoutExercise(WorkoutExerciseId),
		CONSTRAINT CK_ExerciseSet_SetNumber CHECK (SetNumber > 0),
		CONSTRAINT CK_ExerciseSet_Weight CHECK (Weight >= 0.0),
		CONSTRAINT CK_ExerciseSet_Reps CHECK (Reps >= 0),
		CONSTRAINT CK_ExerciseSet_Time CHECK ([Time] >= 0)
