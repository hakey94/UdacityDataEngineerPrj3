IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'data_hakey94_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [data_hakey94_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://data@hakey94.dfs.core.windows.net' 
	)
GO

CREATE EXTERNAL TABLE staging_payments (
	[PaymentId] bigint,
	[Date] datetime2(7),
	[Amout] float,
	[RiderId] bigint
	)
	WITH (
	LOCATION = 'publicpayment.csv',
	DATA_SOURCE = [data_hakey94_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_payments
GO