#Head(5)
SELECT * FROM dataset LIMIT 5;
 #Count rows
 select count(*) as total_rows from dataset;
 #Count columns
SELECT count(*) from INFORMATION_SCHEMA.columns where tABLE_name='dataset';

#Selecting distinct columns
SELECT DISTINCT Date , 
windSpeed , 
Power ,
NacelleAmbientTemperature , 
GeneratorBearingTemperature , 
GearOilTemperature , 
AmbientTemperature ,
RotorSpeed , 
NacelleTemperature , 
BearingTemperature ,
GeneratorSpeed , 
yawAngle ,
WindDirection ,
WheelhubTemperature ,
GearboxInletTemperature ,
FailureStatus FROM dataset;

#Checking Missing values
SELECT * 
FROM dataset
WHERE
    (Date IS NULL OR Date = '') OR
    (windSpeed IS NULL OR windSpeed = '') OR
    (Power IS NULL OR Power = '') OR
    (NacelleAmbientTemperature IS NULL OR NacelleAmbientTemperature = '') OR
    (GeneratorBearingTemperature IS NULL OR GeneratorBearingTemperature = '') OR
    (GearOilTemperature IS NULL OR GearOilTemperature = '') OR
    (AmbientTemperature IS NULL OR AmbientTemperature = '') OR
    (RotorSpeed IS NULL OR RotorSpeed = '') OR
    (NacelleTemperature IS NULL OR NacelleTemperature = '') OR
    (BearingTemperature IS NULL OR BearingTemperature = '') OR
    (GeneratorSpeed IS NULL OR GeneratorSpeed = '') OR
    (yawAngle IS NULL OR yawAngle = '') OR
    (WindDirection IS NULL OR WindDirection = '') OR
    (WheelhubTemperature IS NULL OR WheelhubTemperature = '') OR
    (GearboxInletTemperature IS NULL OR GearboxInletTemperature = '') OR
    (FailureStatus IS NULL OR FailureStatus = '');
    
    #Summary statistics
    SELECT
    COUNT(*) AS total_rows,
    SUM(Date) AS sum_Date,
    AVG(Date) AS average_Date,
    MIN(Date) AS minimum_Date,
    MAX(Date) AS maximum_Date,
    SUM(windSpeed) AS sum_windSpeed,
    AVG(windSpeed) AS average_windSpeed,
    MIN(windSpeed) AS minimum_windSpeed,
    MAX(windSpeed) AS maximum_windSpeed,
    SUM(Power) AS sum_Power,
    AVG(Power) AS average_Power,
    MIN(Power) AS minimum_Power,
    MAX(Power) AS maximum_Power,
    SUM(NacelleAmbientTemperature) AS sum_NacelleAmbientTemperature,
    AVG(NacelleAmbientTemperature) AS average_NacelleAmbientTemperature,
    MIN(NacelleAmbientTemperature) AS minimum_NacelleAmbientTemperature,
    MAX(NacelleAmbientTemperature) AS maximum_NacelleAmbientTemperature,
    SUM(GeneratorBearingTemperature) AS sum_GeneratorBearingTemperature,
    AVG(GeneratorBearingTemperature) AS average_GeneratorBearingTemperature,
    MIN(GeneratorBearingTemperature) AS minimum_GeneratorBearingTemperature,
    MAX(GeneratorBearingTemperature) AS maximum_GeneratorBearingTemperature,
    SUM(GearOilTemperature) AS sum_GearOilTemperature,
    AVG(GearOilTemperature) AS average_GearOilTemperature,
    MIN(GearOilTemperature) AS minimum_GearOilTemperature,
    MAX(GearOilTemperature) AS maximum_GearOilTemperature,
    SUM(AmbientTemperature) AS sum_AmbientTemperature,
    AVG(AmbientTemperature) AS average_AmbientTemperature,
    MIN(AmbientTemperature) AS minimum_AmbientTemperature,
    MAX(AmbientTemperature) AS maximum_AmbientTemperature,
    SUM(RotorSpeed) AS sum_RotorSpeed,
    AVG(RotorSpeed) AS average_RotorSpeed,
    MIN(RotorSpeed) AS minimum_RotorSpeed,
    MAX(RotorSpeed) AS maximum_RotorSpeed,
    SUM(NacelleTemperature) AS sum_NacelleTemperature,
    AVG(NacelleTemperature) AS average_NacelleTemperature,
    MIN(NacelleTemperature) AS minimum_NacelleTemperature,
    MAX(NacelleTemperature) AS maximum_NacelleTemperature,
    SUM(BearingTemperature) AS sum_BearingTemperature,
    AVG(BearingTemperature) AS average_BearingTemperature,
    MIN(BearingTemperature) AS minimum_BearingTemperature,
    MAX(BearingTemperature) AS maximum_BearingTemperature,
    SUM(GeneratorSpeed) AS sum_GeneratorSpeed,
    AVG(GeneratorSpeed) AS average_GeneratorSpeed,
    MIN(GeneratorSpeed) AS minimum_GeneratorSpeed,
    MAX(GeneratorSpeed) AS maximum_GeneratorSpeed,
    SUM(yawAngle) AS sum_yawAngle,
    AVG(yawAngle) AS average_yawAngle,
    MIN(yawAngle) AS minimum_yawAngle,
    MAX(yawAngle) AS maximum_yawAngle,
    SUM(WindDirection) AS sum_WindDirection,
    AVG(WindDirection) AS average_WindDirection,
    MIN(WindDirection) AS minimum_WindDirection,
    MAX(WindDirection) AS maximum_WindDirection,
    SUM(WheelhubTemperature) AS sum_WheelhubTemperature,
    AVG(WheelhubTemperature) AS average_WheelhubTemperature,
    MIN(WheelhubTemperature) AS minimum_WheelhubTemperature,
    MAX(WheelhubTemperature) AS maximum_WheelhubTemperature,
    SUM(GearboxInletTemperature) AS sum_GearboxInletTemperature,
    AVG(GearboxInletTemperature) AS average_GearboxInletTemperature,
    MIN(GearboxInletTemperature) AS minimum_GearboxInletTemperature,
    MAX(GearboxInletTemperature) AS maximum_GearboxInletTemperature,
    SUM(FailureStatus) AS sum_FailureStatus,
    AVG(FailureStatus) AS average_FailureStatus,
    MIN(FailureStatus) AS minimum_FailureStatus,
    MAX(FailureStatus) AS maximum_FailureStatus
FROM dataset;

#Mean calculation
SELECT
    AVG(Date) AS mean_Date,
    AVG(windSpeed) AS mean_windSpeed,
    AVG(Power) AS mean_Power,
    AVG(NacelleAmbientTemperature) AS mean_NacelleAmbientTemperature,
    AVG(GeneratorBearingTemperature) AS mean_GeneratorBearingTemperature,
    AVG(GearOilTemperature) AS mean_GearOilTemperature,
    AVG(AmbientTemperature) AS mean_AmbientTemperature,
    AVG(RotorSpeed) AS mean_RotorSpeed,
    AVG(NacelleTemperature) AS mean_NacelleTemperature,
    AVG(BearingTemperature) AS mean_BearingTemperature,
    AVG(GeneratorSpeed) AS mean_GeneratorSpeed,
    AVG(yawAngle) AS mean_yawAngle,
    AVG(WindDirection) AS mean_WindDirection,
    AVG(WheelhubTemperature) AS mean_WheelhubTemperature,
    AVG(GearboxInletTemperature) AS mean_GearboxInletTemperature,
    AVG(FailureStatus) AS mean_FailureStatus
FROM dataset;

#Median calculation
SELECT
  SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(AmbientTemperature ORDER BY AmbientTemperature), ',', (COUNT(*) + 1) / 2), ',', -1) AS AmbientTemperature_median,
  SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(BearingTemperature ORDER BY BearingTemperature), ',', (COUNT(*) + 1) / 2), ',', -1) AS BearingTemperature_median,
  SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(Date ORDER BY Date), ',', (COUNT(*) + 1) / 2), ',', -1) AS Date_median,
  SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(FailureStatus ORDER BY FailureStatus), ',', (COUNT(*) + 1) / 2), ',', -1) AS FailureStatus_median,
  SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(GearboxInletTemperature ORDER BY GearboxInletTemperature), ',', (COUNT(*) + 1) / 2), ',', -1) AS GearboxInletTemperature_median,
  SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(GearOilTemperature ORDER BY GearOilTemperature), ',', (COUNT(*) + 1) / 2), ',', -1) AS GearOilTemperature_median,
  SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(GeneratorBearingTemperature ORDER BY GeneratorBearingTemperature), ',', (COUNT(*) + 1) / 2), ',', -1) AS GeneratorBearingTemperature_median,
  SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(GeneratorSpeed ORDER BY GeneratorSpeed), ',', (COUNT(*) + 1) / 2), ',', -1) AS GeneratorSpeed_median,
  SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(NacelleAmbientTemperature ORDER BY NacelleAmbientTemperature), ',', (COUNT(*) + 1) / 2), ',', -1) AS NacelleAmbientTemperature_median,
  SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(NacelleTemperature ORDER BY NacelleTemperature), ',', (COUNT(*) + 1) / 2), ',', -1) AS NacelleTemperature_median,
  SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(Power ORDER BY Power), ',', (COUNT(*) + 1) / 2), ',', -1) AS Power_median
FROM dataset;

#Mode calculation
SELECT
  main.column_name,
  GROUP_CONCAT(main.value) AS mode,
  main.frequency
FROM (
  SELECT
    subquery.column_name,
    subquery.value,
    COUNT(*) AS frequency
  FROM (
    SELECT
      'Date' AS column_name,
      Date AS value
    FROM dataset
    UNION ALL
    SELECT
      'windSpeed' AS column_name,
      windSpeed AS value
    FROM dataset
    UNION ALL
    SELECT
      'Power' AS column_name,
      Power AS value
    FROM dataset
    UNION ALL
    SELECT
      'NacelleAmbientTemperature' AS column_name,
      NacelleAmbientTemperature AS value
    FROM dataset
    UNION ALL
    SELECT
      'GeneratorBearingTemperature' AS column_name,
      GeneratorBearingTemperature AS value
    FROM dataset
    UNION ALL
    SELECT
      'GearOilTemperature' AS column_name,
      GearOilTemperature AS value
    FROM dataset
    UNION ALL
    SELECT
      'AmbientTemperature' AS column_name,
      AmbientTemperature AS value
    FROM dataset
    UNION ALL
    SELECT
      'RotorSpeed' AS column_name,
      RotorSpeed AS value
    FROM dataset
    UNION ALL
    SELECT
      'NacelleTemperature' AS column_name,
      NacelleTemperature AS value
    FROM dataset
    UNION ALL
    SELECT
      'BearingTemperature' AS column_name,
      BearingTemperature AS value
    FROM dataset
    UNION ALL
    SELECT
      'GeneratorSpeed' AS column_name,
      GeneratorSpeed AS value
    FROM dataset
    UNION ALL
    SELECT
      'yawAngle' AS column_name,
      yawAngle AS value
    FROM dataset
    UNION ALL
    SELECT
      'WindDirection' AS column_name,
      WindDirection AS value
    FROM dataset
    UNION ALL
    SELECT
      'WheelhubTemperature' AS column_name,
      WheelhubTemperature AS value
    FROM dataset
    UNION ALL
    SELECT
      'GearboxInletTemperature' AS column_name,
      GearboxInletTemperature AS value
    FROM dataset
    UNION ALL
    SELECT
      'FailureStatus' AS column_name,
      FailureStatus AS value
    FROM dataset
  ) AS subquery
  GROUP BY subquery.column_name, subquery.value
  HAVING COUNT(*) = (
    SELECT MAX(frequency)
    FROM (
      SELECT
        subquery.column_name,
        subquery.value,
        COUNT(*) AS frequency
      FROM (
        SELECT
          'Date' AS column_name,
          Date AS value
        FROM dataset
        UNION ALL
        SELECT
          'windSpeed' AS column_name,
          windSpeed AS value
        FROM dataset
        UNION ALL
        SELECT
          'Power' AS column_name,
          Power AS value
        FROM dataset
        UNION ALL
        SELECT
          'NacelleAmbientTemperature' AS column_name,
          NacelleAmbientTemperature AS value
        FROM dataset
        UNION ALL
        SELECT
          'GeneratorBearingTemperature' AS column_name,
          GeneratorBearingTemperature AS value
        FROM dataset
        UNION ALL
        SELECT
          'GearOilTemperature' AS column_name,
          GearOilTemperature AS value
        FROM dataset
        UNION ALL
        SELECT
          'AmbientTemperature' AS column_name,
          AmbientTemperature AS value
        FROM dataset
        UNION ALL
        SELECT
          'RotorSpeed' AS column_name,
          RotorSpeed AS value
        FROM dataset
        UNION ALL
        SELECT
          'NacelleTemperature' AS column_name,
          NacelleTemperature AS value
        FROM dataset
        UNION ALL
        SELECT
          'BearingTemperature' AS column_name,
          BearingTemperature AS value
        FROM dataset
        UNION ALL
        SELECT
          'GeneratorSpeed' AS column_name,
          GeneratorSpeed AS value
        FROM dataset
        UNION ALL
        SELECT
          'yawAngle' AS column_name,
          yawAngle AS value
        FROM dataset
        UNION ALL
        SELECT
          'WindDirection' AS column_name,
          WindDirection AS value
        FROM dataset
        UNION ALL
        SELECT
          'WheelhubTemperature' AS column_name,
          WheelhubTemperature AS value
        FROM dataset
        UNION ALL
        SELECT
          'GearboxInletTemperature' AS column_name,
          GearboxInletTemperature AS value
        FROM dataset
        UNION ALL
        SELECT
          'FailureStatus' AS column_name,
          FailureStatus AS value
        FROM dataset
      ) AS subquery
      GROUP BY subquery.column_name, subquery.value
    ) AS frequency_table
    WHERE frequency_table.column_name = subquery.column_name
  )
) AS main
GROUP BY main.column_name, main.frequency;

#Range Calculation
SELECT
  'Date' AS column_name,
  MIN(Date) AS min_value,
  MAX(Date) AS max_value
FROM dataset
UNION ALL
SELECT
  'windSpeed' AS column_name,
  MIN(windSpeed) AS min_value,
  MAX(windSpeed) AS max_value
FROM dataset
UNION ALL
SELECT
  'Power' AS column_name,
  MIN(Power) AS min_value,
  MAX(Power) AS max_value
FROM dataset
UNION ALL
SELECT
  'NacelleAmbientTemperature' AS column_name,
  MIN(NacelleAmbientTemperature) AS min_value,
  MAX(NacelleAmbientTemperature) AS max_value
FROM dataset
UNION ALL
SELECT
  'GeneratorBearingTemperature' AS column_name,
  MIN(GeneratorBearingTemperature) AS min_value,
  MAX(GeneratorBearingTemperature) AS max_value
FROM dataset
UNION ALL
SELECT
  'GearOilTemperature' AS column_name,
  MIN(GearOilTemperature) AS min_value,
  MAX(GearOilTemperature) AS max_value
FROM dataset
UNION ALL
SELECT
  'AmbientTemperature' AS column_name,
  MIN(AmbientTemperature) AS min_value,
  MAX(AmbientTemperature) AS max_value
FROM dataset
UNION ALL
SELECT
  'RotorSpeed' AS column_name,
  MIN(RotorSpeed) AS min_value,
  MAX(RotorSpeed) AS max_value
FROM dataset
UNION ALL
SELECT
  'NacelleTemperature' AS column_name,
  MIN(NacelleTemperature) AS min_value,
  MAX(NacelleTemperature) AS max_value
FROM dataset
UNION ALL
SELECT
  'BearingTemperature' AS column_name,
  MIN(BearingTemperature) AS min_value,
  MAX(BearingTemperature) AS max_value
FROM dataset
UNION ALL
SELECT
  'GeneratorSpeed' AS column_name,
  MIN(GeneratorSpeed) AS min_value,
  MAX(GeneratorSpeed) AS max_value
FROM dataset
UNION ALL
SELECT
  'yawAngle' AS column_name,
  MIN(yawAngle) AS min_value,
  MAX(yawAngle) AS max_value
FROM dataset
UNION ALL
SELECT
  'WindDirection' AS column_name,
  MIN(WindDirection) AS min_value,
  MAX(WindDirection) AS max_value
FROM dataset
UNION ALL
SELECT
  'WheelhubTemperature' AS column_name,
  MIN(WheelhubTemperature) AS min_value,
  MAX(WheelhubTemperature) AS max_value
FROM dataset
UNION ALL
SELECT
  'GearboxInletTemperature' AS column_name,
  MIN(GearboxInletTemperature) AS min_value,
  MAX(GearboxInletTemperature) AS max_value
FROM dataset
UNION ALL
SELECT
  'FailureStatus' AS column_name,
  MIN(FailureStatus) AS min_value,
  MAX(FailureStatus) AS max_value
FROM dataset;

#Variance Calculation
SELECT
  'Date' AS column_name,
  VARIANCE(Date) AS variance
FROM dataset
UNION ALL
SELECT
  'windSpeed' AS column_name,
  VARIANCE(windSpeed) AS variance
FROM dataset
UNION ALL
SELECT
  'Power' AS column_name,
  VARIANCE(Power) AS variance
FROM dataset
UNION ALL
SELECT
  'NacelleAmbientTemperature' AS column_name,
  VARIANCE(NacelleAmbientTemperature) AS variance
FROM dataset
UNION ALL
SELECT
  'GeneratorBearingTemperature' AS column_name,
  VARIANCE(GeneratorBearingTemperature) AS variance
FROM dataset
UNION ALL
SELECT
  'GearOilTemperature' AS column_name,
  VARIANCE(GearOilTemperature) AS variance
FROM dataset
UNION ALL
SELECT
  'AmbientTemperature' AS column_name,
  VARIANCE(AmbientTemperature) AS variance
FROM dataset
UNION ALL
SELECT
  'RotorSpeed' AS column_name,
  VARIANCE(RotorSpeed) AS variance
FROM dataset
UNION ALL
SELECT
  'NacelleTemperature' AS column_name,
  VARIANCE(NacelleTemperature) AS variance
FROM dataset
UNION ALL
SELECT
  'BearingTemperature' AS column_name,
  VARIANCE(BearingTemperature) AS variance
FROM dataset
UNION ALL
SELECT
  'GeneratorSpeed' AS column_name,
  VARIANCE(GeneratorSpeed) AS variance
FROM dataset
UNION ALL
SELECT
  'yawAngle' AS column_name,
  VARIANCE(yawAngle) AS variance
FROM dataset
UNION ALL
SELECT
  'WindDirection' AS column_name,
  VARIANCE(WindDirection) AS variance
FROM dataset
UNION ALL
SELECT
  'WheelhubTemperature' AS column_name,
  VARIANCE(WheelhubTemperature) AS variance
FROM dataset
UNION ALL
SELECT
  'GearboxInletTemperature' AS column_name,
  VARIANCE(GearboxInletTemperature) AS variance
FROM dataset
UNION ALL
SELECT
  'FailureStatus' AS column_name,
  VARIANCE(FailureStatus) AS variance
FROM dataset;

#Standard Deviation
SELECT
  'Date' AS column_name,
  STDDEV(Date) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'windSpeed' AS column_name,
  STDDEV(windSpeed) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'Power' AS column_name,
  STDDEV(Power) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'NacelleAmbientTemperature' AS column_name,
  STDDEV(NacelleAmbientTemperature) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'GeneratorBearingTemperature' AS column_name,
  STDDEV(GeneratorBearingTemperature) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'GearOilTemperature' AS column_name,
  STDDEV(GearOilTemperature) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'AmbientTemperature' AS column_name,
  STDDEV(AmbientTemperature) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'RotorSpeed' AS column_name,
  STDDEV(RotorSpeed) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'NacelleTemperature' AS column_name,
  STDDEV(NacelleTemperature) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'BearingTemperature' AS column_name,
  STDDEV(BearingTemperature) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'GeneratorSpeed' AS column_name,
  STDDEV(GeneratorSpeed) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'yawAngle' AS column_name,
  STDDEV(yawAngle) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'WindDirection' AS column_name,
  STDDEV(WindDirection) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'WheelhubTemperature' AS column_name,
  STDDEV(WheelhubTemperature) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'GearboxInletTemperature' AS column_name,
  STDDEV(GearboxInletTemperature) AS standard_deviation
FROM dataset
UNION ALL
SELECT
  'FailureStatus' AS column_name,
  STDDEV(FailureStatus) AS standard_deviation
FROM dataset;


#Skewness
SELECT 
   column_name,
   skewness,
   avg_skewness
FROM (
   SELECT 
      'windSpeed' AS column_name,
      (SUM((windSpeed - avg_windSpeed) * (windSpeed - avg_windSpeed) * (windSpeed - avg_windSpeed))) / ((COUNT(windSpeed) - 1) * POWER(STDDEV(windSpeed), 3)) AS skewness
   FROM dataset
   CROSS JOIN (
      SELECT AVG(windSpeed) AS avg_windSpeed
      FROM dataset
   ) AS subquery
   UNION ALL
   SELECT 
      'Power' AS column_name,
      (SUM((Power - avg_Power) * (Power - avg_Power) * (Power - avg_Power))) / ((COUNT(Power) - 1) * POWER(STDDEV(Power), 3)) AS skewness
   FROM dataset
   CROSS JOIN (
      SELECT AVG(Power) AS avg_Power
      FROM dataset
   ) AS subquery
   UNION ALL
   SELECT 
      'NacelleAmbientTemperature' AS column_name,
      (SUM((NacelleAmbientTemperature - avg_NacelleAmbientTemperature) * (NacelleAmbientTemperature - avg_NacelleAmbientTemperature) * (NacelleAmbientTemperature - avg_NacelleAmbientTemperature))) / ((COUNT(NacelleAmbientTemperature) - 1) * POWER(STDDEV(NacelleAmbientTemperature), 3)) AS skewness
   FROM dataset
   CROSS JOIN (
      SELECT AVG(NacelleAmbientTemperature) AS avg_NacelleAmbientTemperature
      FROM dataset
   ) AS subquery
   UNION ALL
   SELECT 
      'GeneratorBearingTemperature' AS column_name,
      (SUM((GeneratorBearingTemperature - avg_GeneratorBearingTemperature) * (GeneratorBearingTemperature - avg_GeneratorBearingTemperature) * (GeneratorBearingTemperature - avg_GeneratorBearingTemperature))) / ((COUNT(GeneratorBearingTemperature) - 1) * POWER(STDDEV(GeneratorBearingTemperature), 3)) AS skewness
   FROM dataset
   CROSS JOIN (
      SELECT AVG(GeneratorBearingTemperature) AS avg_GeneratorBearingTemperature
      FROM dataset
   ) AS subquery
   UNION ALL
   SELECT 
      'GearOilTemperature' AS column_name,
      (SUM((GearOilTemperature - avg_GearOilTemperature) * (GearOilTemperature - avg_GearOilTemperature) * (GearOilTemperature - avg_GearOilTemperature))) / ((COUNT(GearOilTemperature) - 1) * POWER(STDDEV(GearOilTemperature), 3)) AS skewness
   FROM dataset
   CROSS JOIN (
      SELECT AVG(GearOilTemperature) AS avg_GearOilTemperature
      FROM dataset
   ) AS subquery
   UNION ALL
   SELECT 
      'AmbientTemperature' AS column_name,
      (SUM((AmbientTemperature - avg_AmbientTemperature) * (AmbientTemperature - avg_AmbientTemperature) * (AmbientTemperature - avg_AmbientTemperature))) / ((COUNT(AmbientTemperature) - 1) * POWER(STDDEV(AmbientTemperature), 3)) AS skewness
   FROM dataset
   CROSS JOIN (
      SELECT AVG(AmbientTemperature) AS avg_AmbientTemperature
      FROM dataset
   ) AS subquery
   UNION ALL
   SELECT 
      'RotorSpeed' AS column_name,
      (SUM((RotorSpeed - avg_RotorSpeed) * (RotorSpeed - avg_RotorSpeed) * (RotorSpeed - avg_RotorSpeed))) / ((COUNT(RotorSpeed) - 1) * POWER(STDDEV(RotorSpeed), 3)) AS skewness
   FROM dataset
   CROSS JOIN (
      SELECT AVG(RotorSpeed) AS avg_RotorSpeed
      FROM dataset
   ) AS subquery
   UNION ALL
   SELECT 
      'NacelleTemperature' AS column_name,
      (SUM((NacelleTemperature - avg_NacelleTemperature) * (NacelleTemperature - avg_NacelleTemperature) * (NacelleTemperature - avg_NacelleTemperature))) / ((COUNT(NacelleTemperature) - 1) * POWER(STDDEV(NacelleTemperature), 3)) AS skewness
   FROM dataset
   CROSS JOIN (
      SELECT AVG(NacelleTemperature) AS avg_NacelleTemperature
      FROM dataset
   ) AS subquery
   UNION ALL
   SELECT 
      'BearingTemperature' AS column_name,
      (SUM((BearingTemperature - avg_BearingTemperature) * (BearingTemperature - avg_BearingTemperature) * (BearingTemperature - avg_BearingTemperature))) / ((COUNT(BearingTemperature) - 1) * POWER(STDDEV(BearingTemperature), 3)) AS skewness
   FROM dataset
   CROSS JOIN (
      SELECT AVG(BearingTemperature) AS avg_BearingTemperature
      FROM dataset
   ) AS subquery
) AS results
CROSS JOIN (
   SELECT AVG(skewness) AS avg_skewness
   FROM (
      SELECT 
         'windSpeed' AS column_name,
         (SUM((windSpeed - avg_windSpeed) * (windSpeed - avg_windSpeed) * (windSpeed - avg_windSpeed))) / ((COUNT(windSpeed) - 1) * POWER(STDDEV(windSpeed), 3)) AS skewness
      FROM dataset
      CROSS JOIN (
         SELECT AVG(windSpeed) AS avg_windSpeed
         FROM dataset
      ) AS subquery
      UNION ALL
      SELECT 
         'Power' AS column_name,
         (SUM((Power - avg_Power) * (Power - avg_Power) * (Power - avg_Power))) / ((COUNT(Power) - 1) * POWER(STDDEV(Power), 3)) AS skewness
      FROM dataset
      CROSS JOIN (
         SELECT AVG(Power) AS avg_Power
         FROM dataset
      ) AS subquery
      UNION ALL
      SELECT 
         'NacelleAmbientTemperature' AS column_name,
         (SUM((NacelleAmbientTemperature - avg_NacelleAmbientTemperature) * (NacelleAmbientTemperature - avg_NacelleAmbientTemperature) * (NacelleAmbientTemperature - avg_NacelleAmbientTemperature))) / ((COUNT(NacelleAmbientTemperature) - 1) * POWER(STDDEV(NacelleAmbientTemperature), 3)) AS skewness
      FROM dataset
      CROSS JOIN (
         SELECT AVG(NacelleAmbientTemperature) AS avg_NacelleAmbientTemperature
         FROM dataset
      ) AS subquery
      UNION ALL
      SELECT 
         'GeneratorBearingTemperature' AS column_name,
         (SUM((GeneratorBearingTemperature - avg_GeneratorBearingTemperature) * (GeneratorBearingTemperature - avg_GeneratorBearingTemperature) * (GeneratorBearingTemperature - avg_GeneratorBearingTemperature))) / ((COUNT(GeneratorBearingTemperature) - 1) * POWER(STDDEV(GeneratorBearingTemperature), 3)) AS skewness
      FROM dataset
      CROSS JOIN (
         SELECT AVG(GeneratorBearingTemperature) AS avg_GeneratorBearingTemperature
         FROM dataset
      ) AS subquery
      UNION ALL
      SELECT 
         'GearOilTemperature' AS column_name,
         (SUM((GearOilTemperature - avg_GearOilTemperature) * (GearOilTemperature - avg_GearOilTemperature) * (GearOilTemperature - avg_GearOilTemperature))) / ((COUNT(GearOilTemperature) - 1) * POWER(STDDEV(GearOilTemperature), 3)) AS skewness
      FROM dataset
      CROSS JOIN (
         SELECT AVG(GearOilTemperature) AS avg_GearOilTemperature
         FROM dataset
      ) AS subquery
      UNION ALL
      SELECT 
         'AmbientTemperature' AS column_name,
         (SUM((AmbientTemperature - avg_AmbientTemperature) * (AmbientTemperature - avg_AmbientTemperature) * (AmbientTemperature - avg_AmbientTemperature))) / ((COUNT(AmbientTemperature) - 1) * POWER(STDDEV(AmbientTemperature), 3)) AS skewness
      FROM dataset
      CROSS JOIN (
         SELECT AVG(AmbientTemperature) AS avg_AmbientTemperature
         FROM dataset
      ) AS subquery
      UNION ALL
      SELECT 
         'RotorSpeed' AS column_name,
         (SUM((RotorSpeed - avg_RotorSpeed) * (RotorSpeed - avg_RotorSpeed) * (RotorSpeed - avg_RotorSpeed))) / ((COUNT(RotorSpeed) - 1) * POWER(STDDEV(RotorSpeed), 3)) AS skewness
      FROM dataset
      CROSS JOIN (
         SELECT AVG(RotorSpeed) AS avg_RotorSpeed
         FROM dataset
      ) AS subquery
      UNION ALL
      SELECT 
         'NacelleTemperature' AS column_name,
         (SUM((NacelleTemperature - avg_NacelleTemperature) * (NacelleTemperature - avg_NacelleTemperature) * (NacelleTemperature - avg_NacelleTemperature))) / ((COUNT(NacelleTemperature) - 1) * POWER(STDDEV(NacelleTemperature), 3)) AS skewness
      FROM dataset
      CROSS JOIN (
         SELECT AVG(NacelleTemperature) AS avg_NacelleTemperature
         FROM dataset
      ) AS subquery
      UNION ALL
      SELECT 
         'BearingTemperature' AS column_name,
         (SUM((BearingTemperature - avg_BearingTemperature) * (BearingTemperature - avg_BearingTemperature) * (BearingTemperature - avg_BearingTemperature))) / ((COUNT(BearingTemperature) - 1) * POWER(STDDEV(BearingTemperature), 3)) AS skewness
      FROM dataset
      CROSS JOIN (
         SELECT AVG(BearingTemperature) AS avg_BearingTemperature
         FROM dataset
      ) AS subquery
   ) AS subresults
) AS avg_skewness;


