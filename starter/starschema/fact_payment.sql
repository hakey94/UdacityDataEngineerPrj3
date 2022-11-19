
GO;

CREATE TABLE fact_payment (
	[PaymentId] [bigint]  NULL,
	[Amount] [float]  NULL,
	[RiderId] [bigint]  NULL,
	[TimeId] [uniqueidentifier]  NULL
)
GO;

INSERT INTO fact_payment (
	[PaymentId],
	[Amount],
	[RiderId] ,
	[TimeId])
SELECT
    [PaymentId],
    [staging_payments].[Amout],
    [staging_payments].[RiderId],
    [dim_time].[TimeId]
FROM [dbo].[staging_payments]
JOIN dim_time ON DATEADD(dd, 0, DATEDIFF(dd, 0, [dim_time].[Date])) = DATEADD(dd, 0, DATEDIFF(dd, 0, [staging_payments].[Date]))


