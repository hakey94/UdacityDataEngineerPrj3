GO;

CREATE TABLE dim_station (
	[StationId] [nvarchar](500)  NULL,
	[Name] [nvarchar](500)  NULL,
	[Latitude] [float]  NULL,
	[Longitude] [float]  NULL
)
GO;

INSERT INTO dim_station (
    [StationId],
    [Name],
    [Latitude],
    [Longitude])
    SELECT  [StationId],
            [Name],
            [Latitude],
            [Longitude]
    FROM staging_stations

GO;

SELECT TOP (100) * FROM [dbo].[dim_station]
