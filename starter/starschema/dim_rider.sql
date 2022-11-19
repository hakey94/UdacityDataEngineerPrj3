GO;

CREATE TABLE dim_rider (
	[RiderId] [bigint]  NULL,
	[FirstName] [nvarchar](500)  NULL,
	[LastName] [nvarchar](500)  NULL,
	[Address] [nvarchar](500)  NULL,
	[BirthDay] datetime2(7)  NULL,
	[StartDate] datetime2(7)  NULL,
	[EndDate] datetime2(7)  NULL,
	[IsMember] [bit]  NULL
)
GO;

INSERT INTO dim_rider (
    [RiderId]
    ,[FirstName]
    ,[LastName]
    ,[Address]
    ,[BirthDay]
    ,[StartDate]
    ,[EndDate]
    ,[IsMember])
SELECT 
    [RiderId]
    ,[FirstName]
    ,[LastName]
    ,[Address]
    ,[BirthDay]
    ,[StartDate]
    ,[EndDate]
    ,[IsMember]
FROM staging_riders

GO;

SELECT TOP (100) * FROM [dbo].[dim_rider]
