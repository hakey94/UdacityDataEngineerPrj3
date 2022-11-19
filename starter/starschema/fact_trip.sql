Drop table fact_trip

CREATE TABLE fact_trip (
    [TripId] VARCHAR(50) NOT NULL,
    [RiderId] INTEGER,
    [StartStationId] VARCHAR(50), 
    [EndStationId] VARCHAR(50), 
    [StartTimeId] VARCHAR(50),
    [EndTimeId] VARCHAR(50),
    [Type] VARCHAR(75),
    [Duration] VARCHAR(75),
    [RiderAge] VARCHAR(75)
);

ALTER TABLE fact_trip add CONSTRAINT PK_fact_trip_trip_id PRIMARY KEY NONCLUSTERED (TripId) NOT ENFORCED


INSERT INTO fact_trip (
    [TripId],
    [RiderId],
    [StartStationId], 
    [EndStationId], 
    [StartTimeId], 
    [EndTimeId], 
    [Type],
    [Duration],
    [RiderAge])
SELECT 
    staging_trips.TripId,
    staging_riders.RiderId,
    staging_trips.StartStationId, 
    staging_trips.EndStationId, 
    start_time.TimeID                                                  AS StartTimeId,
    end_time.TimeID                                                    AS EndTimeId,
    staging_trips.Type,
    DATEDIFF(hour, staging_trips.StartAt, staging_trips.EndAt)      AS Duration,
    DATEDIFF(year, staging_riders.BirthDay, staging_trips.StartAt)     AS RiderAge

FROM staging_trips
JOIN staging_riders             ON staging_riders.RiderId = staging_trips.RiderId
JOIN dim_time AS start_time     ON start_time.[Date] = staging_trips.StartAt
JOIN dim_time AS end_time       ON DATEDIFF(dd, 0, end_time.[Date]) = DATEDIFF(dd, 0, staging_trips.EndAt)