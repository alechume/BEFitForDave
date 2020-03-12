
INSERT INTO Category (CategoryName,Description) VALUES ('Back','A back category description') --1
INSERT INTO Category (CategoryName,Description) VALUES ('Legs','A legs category description') --2
INSERT INTO Category (CategoryName,Description) VALUES ('Chest','A chest category description') --3
INSERT INTO Category (CategoryName,Description) VALUES ('Cardio','A cardio category description') --4
INSERT INTO Category (CategoryName,Description) VALUES ('Arms','A arms category description') --5
INSERT INTO Category (CategoryName,Description) VALUES ('Core','A core category description') --6

INSERT INTO Exercise (ExerciseName,Description) VALUES ('Deadlift','A deadlift description') --1
INSERT INTO Exercise (ExerciseName,Description) VALUES ('Bench-Press','A bench-press description') --2
INSERT INTO Exercise (ExerciseName,Description) VALUES ('Treadmill','A treadmill description') --3
INSERT INTO Exercise (ExerciseName,Description) VALUES ('Sled-Push','A sled-push description') --4
INSERT INTO Exercise (ExerciseName,Description) VALUES ('Squat','A squat description') --5
INSERT INTO Exercise (ExerciseName,Description) VALUES ('Tricep-Extension','A tricep-extension description') --6
INSERT INTO Exercise (ExerciseName,Description) VALUES ('DB-Rows','A db-rows description') --7
INSERT INTO Exercise (ExerciseName,Description) VALUES ('Plank','A plank description') --8

INSERT INTO ExerciseCategory (ExerciseId,CategoryId) VALUES (1,1)
INSERT INTO ExerciseCategory (ExerciseId,CategoryId) VALUES (1,2)
INSERT INTO ExerciseCategory (ExerciseId,CategoryId) VALUES (2,3)
INSERT INTO ExerciseCategory (ExerciseId,CategoryId) VALUES (3,4)
INSERT INTO ExerciseCategory (ExerciseId,CategoryId) VALUES (4,4)
INSERT INTO ExerciseCategory (ExerciseId,CategoryId) VALUES (5,2)
INSERT INTO ExerciseCategory (ExerciseId,CategoryId) VALUES (6,5)
INSERT INTO ExerciseCategory (ExerciseId,CategoryId) VALUES (7,1)
INSERT INTO ExerciseCategory (ExerciseId,CategoryId) VALUES (7,5)
INSERT INTO ExerciseCategory (ExerciseId,CategoryId) VALUES (8,6)

/* ---------------------------------------------------------------------
* Client: Steve
------------------------------------------------------------------------ */
INSERT INTO [User] (Email) VALUES ('Steve@gmail.com')

INSERT INTO Client (NickName,UserId) VALUES ('Steve',1)

INSERT INTO WorkoutPlan (ClientId,WorkoutPlanName,DateCreated,IsActive,Notes)
VALUES (1,'Deadlift','2020-03-02',1,'Steves deadlift workout... some more notes go here') --1
INSERT INTO WorkoutPlan (ClientId,WorkoutPlanName,DateCreated,IsActive,Notes)
VALUES (1,'Squat','2020-03-02',1,'Steves squat workout... some more notes go here') --2
INSERT INTO WorkoutPlan (ClientId,WorkoutPlanName,DateCreated,IsActive,Notes)
VALUES (1,'Bench','2020-03-02',1,'Steves bench workout... some more notes go here') --3
INSERT INTO WorkoutPlan (ClientId,WorkoutPlanName,DateCreated,IsActive,Notes)
VALUES (1,'Deadlift2','2020-02-02',0,'Steves deadlift workout... some more notes go here') --4
INSERT INTO WorkoutPlan (ClientId,WorkoutPlanName,DateCreated,IsActive,Notes)
VALUES (1,'Squat2','2020-02-02',0,'Steves squat workout... some more notes go here') --5
INSERT INTO WorkoutPlan (ClientId,WorkoutPlanName,DateCreated,IsActive,Notes)
VALUES (1,'Bench2','2020-02-02',0,'Steves bench workout... some more notes go here') --6

INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --1
VALUES (1,1,'Reps',180,NULL,8,1)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,1,0,1,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --2
VALUES (1,1,'Reps',90,NULL,NULL,2)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,2,245,2,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,2,245,2,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --3
VALUES (1,1,'Reps',90,NULL,NULL,3)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,3,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,3,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,3,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (4,3,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (5,3,230,5,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --4
VALUES (1,2,'Reps',90,NULL,NULL,4)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,4,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,4,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,4,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (4,4,160,4,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --5
VALUES (1,3,'Time',0,NULL,NULL,5)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,5,0,NULL,1800,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --6
VALUES (1,4,'Distance',60,NULL,NULL,6)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,6,100,NULL,NULL,'50/Meters',NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,6,100,NULL,NULL,'50/Meters',NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,6,100,NULL,NULL,'50/Meters',NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --7
VALUES (1,5,'Reps',90,'1-1-2',NULL,7)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,7,135,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,7,135,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,7,135,5,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --8
VALUES (1,6,'Interval',0,NULL,NULL,8)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,8,30,NULL,NULL,NULL,'20/10/80')
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order],HasSuperset) --9
VALUES (1,7,'Reps',0,NULL,NULL,9,1)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,9,50,10,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,9,50,10,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,9,50,10,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order],SupersetId) --10
VALUES (1,8,'Time',75,NULL,NULL,10,9)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,10,0,NULL,60,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,10,0,NULL,60,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,10,0,NULL,60,NULL,NULL)


INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --11
VALUES (2,1,'Reps',180,NULL,8,1)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,11,0,1,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --12
VALUES (2,1,'Reps',90,NULL,NULL,2)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,12,245,2,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,12,245,2,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --13
VALUES (2,1,'Reps',90,NULL,NULL,3)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,13,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,13,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,13,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (4,13,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (5,13,230,5,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --14
VALUES (2,2,'Reps',90,NULL,NULL,4)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,14,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,14,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,14,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (4,14,160,4,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --15
VALUES (2,3,'Time',0,NULL,NULL,5)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,15,0,NULL,1800,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --16
VALUES (2,4,'Distance',60,NULL,NULL,6)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,16,100,NULL,NULL,'50/Meters',NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,16,100,NULL,NULL,'50/Meters',NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,16,100,NULL,NULL,'50/Meters',NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --17
VALUES (2,5,'Reps',90,'1-1-2',NULL,7)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,17,135,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,17,135,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,17,135,5,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --18
VALUES (2,6,'Interval',0,NULL,NULL,8)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,18,30,NULL,NULL,NULL,'20/10/80')
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order],HasSuperset) --19
VALUES (2,7,'Reps',0,NULL,NULL,9,1)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,19,50,10,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,19,50,10,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,19,50,10,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order],SupersetId) --20
VALUES (2,8,'Time',75,NULL,NULL,10,19)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,20,0,NULL,60,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,20,0,NULL,60,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,20,0,NULL,60,NULL,NULL)


INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --21
VALUES (3,1,'Reps',180,NULL,8,1)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,21,0,1,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --22
VALUES (3,1,'Reps',90,NULL,NULL,2)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,22,245,2,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,22,245,2,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --23
VALUES (3,1,'Reps',90,NULL,NULL,3)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,23,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,23,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,23,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (4,23,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (5,23,230,5,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --24
VALUES (3,2,'Reps',90,NULL,NULL,4)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,24,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,24,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,24,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (4,24,160,4,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --25
VALUES (3,3,'Time',0,NULL,NULL,5)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,25,0,NULL,1800,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --26
VALUES (3,4,'Distance',60,NULL,NULL,6)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,26,100,NULL,NULL,'50/Meters',NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,26,100,NULL,NULL,'50/Meters',NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,26,100,NULL,NULL,'50/Meters',NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --27
VALUES (3,5,'Reps',90,'1-1-2',NULL,7)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,27,135,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,27,135,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,27,135,5,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --28
VALUES (3,6,'Interval',0,NULL,NULL,8)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,28,30,NULL,NULL,NULL,'20/10/80')
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order],HasSuperset) --29
VALUES (3,7,'Reps',0,NULL,NULL,9,1)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,29,50,10,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,29,50,10,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,29,50,10,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order],SupersetId) --30
VALUES (3,8,'Time',75,NULL,NULL,10,29)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,30,0,NULL,60,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,30,0,NULL,60,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,30,0,NULL,60,NULL,NULL)


INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --31
VALUES (4,1,'Reps',180,NULL,8,1)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,31,0,1,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --32
VALUES (4,1,'Reps',90,NULL,NULL,2)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,32,245,2,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,32,245,2,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --33
VALUES (4,1,'Reps',90,NULL,NULL,3)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,33,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,33,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,33,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (4,33,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (5,33,230,5,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --34
VALUES (4,2,'Reps',90,NULL,NULL,4)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,34,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,34,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,34,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (4,34,160,4,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --35
VALUES (4,3,'Time',0,NULL,NULL,5)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,35,0,NULL,1800,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --36
VALUES (4,4,'Distance',60,NULL,NULL,6)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,36,100,NULL,NULL,'50/Meters',NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,36,100,NULL,NULL,'50/Meters',NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,36,100,NULL,NULL,'50/Meters',NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --37
VALUES (4,5,'Reps',90,'1-1-2',NULL,7)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,37,135,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,37,135,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,37,135,5,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --38
VALUES (4,6,'Interval',0,NULL,NULL,8)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,38,30,NULL,NULL,NULL,'20/10/80')
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order],HasSuperset) --39
VALUES (4,7,'Reps',0,NULL,NULL,9,1)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,39,50,10,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,39,50,10,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,39,50,10,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order],SupersetId) --40
VALUES (4,8,'Time',75,NULL,NULL,10,39)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,40,0,NULL,60,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,40,0,NULL,60,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,40,0,NULL,60,NULL,NULL)


INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --41
VALUES (5,1,'Reps',180,NULL,8,1)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,41,0,1,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --42
VALUES (5,1,'Reps',90,NULL,NULL,2)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,42,245,2,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,42,245,2,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --43
VALUES (5,1,'Reps',90,NULL,NULL,3)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,43,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,43,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,43,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (4,43,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (5,43,230,5,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --44
VALUES (5,2,'Reps',90,NULL,NULL,4)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,44,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,44,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,44,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (4,44,160,4,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --45
VALUES (5,3,'Time',0,NULL,NULL,5)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,45,0,NULL,1800,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --46
VALUES (5,4,'Distance',60,NULL,NULL,6)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,46,100,NULL,NULL,'50/Meters',NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,46,100,NULL,NULL,'50/Meters',NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,46,100,NULL,NULL,'50/Meters',NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --47
VALUES (5,5,'Reps',90,'1-1-2',NULL,7)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,47,135,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,47,135,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,47,135,5,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --48
VALUES (5,6,'Interval',0,NULL,NULL,8)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,48,30,NULL,NULL,NULL,'20/10/80')
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order],HasSuperset) --49
VALUES (5,7,'Reps',0,NULL,NULL,9,1)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,49,50,10,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,49,50,10,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,49,50,10,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order],SupersetId) --50
VALUES (5,8,'Time',75,NULL,NULL,10,49)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,50,0,NULL,60,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,50,0,NULL,60,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,50,0,NULL,60,NULL,NULL)


INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --51
VALUES (6,1,'Reps',180,NULL,8,1)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,51,0,1,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --52
VALUES (6,1,'Reps',90,NULL,NULL,2)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,52,245,2,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,52,245,2,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --53
VALUES (6,1,'Reps',90,NULL,NULL,3)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,53,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,53,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,53,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (4,53,230,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (5,53,230,5,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --54
VALUES (6,2,'Reps',90,NULL,NULL,4)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,54,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,54,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,54,160,4,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (4,54,160,4,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --55
VALUES (6,3,'Time',0,NULL,NULL,5)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,55,0,NULL,1800,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --56
VALUES (6,4,'Distance',60,NULL,NULL,6)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,56,100,NULL,NULL,'50/Meters',NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,56,100,NULL,NULL,'50/Meters',NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,56,100,NULL,NULL,'50/Meters',NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --57
VALUES (6,5,'Reps',90,'1-1-2',NULL,7)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,57,135,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,57,135,5,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,57,135,5,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order]) --58
VALUES (6,6,'Interval',0,NULL,NULL,8)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,58,30,NULL,NULL,NULL,'20/10/80')
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order],HasSuperset) --59
VALUES (6,7,'Reps',0,NULL,NULL,9,1)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,59,50,10,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,59,50,10,NULL,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,59,50,10,NULL,NULL,NULL)
INSERT INTO ExercisePlan (WorkoutPlanId,ExerciseId,Type,Rest,Tempo,RPE,[Order],SupersetId) --60
VALUES (6,8,'Time',75,NULL,NULL,10,59)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (1,60,0,NULL,60,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (2,60,0,NULL,60,NULL,NULL)
	INSERT INTO SetPlan (SetNumber,ExercisePlanId,Weight,Reps,[Time],Distance,Interval) VALUES (3,60,0,NULL,60,NULL,NULL)
