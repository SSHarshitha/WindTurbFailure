#Check data types
SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='DATASET';

#Handling Duplicates
SELECT * FROM (SELECT *,
    ROW_NUMBER() OVER (PARTITION BY Date, windSpeed, Power, NacelleAmbientTemperature, GeneratorBearingTemperature,
                                  GearOilTemperature, AmbientTemperature, RotorSpeed, NacelleTemperature,
                                  BearingTemperature, GeneratorSpeed, yawAngle, WindDirection, WheelhubTemperature,
                                  GearboxInletTemperature, FailureStatus
                      ORDER BY Date) AS RowNumber
  FROM dataset
) AS t WHERE RowNumber > 1;

#Outlier Analysis
SELECT 
  Date, windSpeed, Power, NacelleAmbientTemperature, GeneratorBearingTemperature,
  GearOilTemperature, AmbientTemperature, RotorSpeed, NacelleTemperature,
  BearingTemperature, GeneratorSpeed, yawAngle, WindDirection,
  WheelhubTemperature, GearboxInletTemperature
FROM dataset
WHERE
  windSpeed < (SELECT AVG(windSpeed) - 4 * STDDEV(windSpeed) FROM dataset) OR windSpeed > (SELECT AVG(windSpeed) + 4 * STDDEV(windSpeed) FROM dataset) OR
  Power < (SELECT AVG(Power) - 4 * STDDEV(Power) FROM dataset) OR Power > (SELECT AVG(Power) + 4 * STDDEV(Power) FROM dataset) OR
  NacelleAmbientTemperature < (SELECT AVG(NacelleAmbientTemperature) - 4 * STDDEV(NacelleAmbientTemperature) FROM dataset) OR NacelleAmbientTemperature > (SELECT AVG(NacelleAmbientTemperature) + 4 * STDDEV(NacelleAmbientTemperature) FROM dataset) OR
  GeneratorBearingTemperature < (SELECT AVG(GeneratorBearingTemperature) - 4 * STDDEV(GeneratorBearingTemperature) FROM dataset) OR GeneratorBearingTemperature > (SELECT AVG(GeneratorBearingTemperature) + 4 * STDDEV(GeneratorBearingTemperature) FROM dataset) OR
  GearOilTemperature < (SELECT AVG(GearOilTemperature) - 4 * STDDEV(GearOilTemperature) FROM dataset) OR GearOilTemperature > (SELECT AVG(GearOilTemperature) + 4 * STDDEV(GearOilTemperature) FROM dataset) OR
  AmbientTemperature < (SELECT AVG(AmbientTemperature) - 4 * STDDEV(AmbientTemperature) FROM dataset) OR AmbientTemperature > (SELECT AVG(AmbientTemperature) + 4 * STDDEV(AmbientTemperature) FROM dataset) OR
  RotorSpeed < (SELECT AVG(RotorSpeed) - 4 * STDDEV(RotorSpeed) FROM dataset) OR RotorSpeed > (SELECT AVG(RotorSpeed) + 4 * STDDEV(RotorSpeed) FROM dataset) OR
  NacelleTemperature < (SELECT AVG(NacelleTemperature) - 4 * STDDEV(NacelleTemperature) FROM dataset) OR NacelleTemperature > (SELECT AVG(NacelleTemperature) + 4 * STDDEV(NacelleTemperature) FROM dataset) OR
  BearingTemperature < (SELECT AVG(BearingTemperature) - 4 * STDDEV(BearingTemperature) FROM dataset) OR BearingTemperature > (SELECT AVG(BearingTemperature) + 4 * STDDEV(BearingTemperature) FROM dataset) OR
  GeneratorSpeed < (SELECT AVG(GeneratorSpeed) - 4 * STDDEV(GeneratorSpeed) FROM dataset) OR GeneratorSpeed > (SELECT AVG(GeneratorSpeed) + 4 * STDDEV(GeneratorSpeed) FROM dataset) OR
  yawAngle < (SELECT AVG(yawAngle) - 4 * STDDEV(yawAngle) FROM dataset) OR yawAngle > (SELECT AVG(yawAngle) + 4 * STDDEV(yawAngle) FROM dataset) OR
  WindDirection < (SELECT AVG(WindDirection) - 4 * STDDEV(WindDirection) FROM dataset) OR WindDirection > (SELECT AVG(WindDirection) + 4 * STDDEV(WindDirection) FROM dataset) OR
  WheelhubTemperature < (SELECT AVG(WheelhubTemperature) - 4 * STDDEV(WheelhubTemperature) FROM dataset) OR WheelhubTemperature > (SELECT AVG(WheelhubTemperature) + 4 * STDDEV(WheelhubTemperature) FROM dataset) OR
  GearboxInletTemperature < (SELECT AVG(GearboxInletTemperature) - 4 * STDDEV(GearboxInletTemperature) FROM dataset) OR GearboxInletTemperature > (SELECT AVG(GearboxInletTemperature) + 4 * STDDEV(GearboxInletTemperature) FROM dataset);

#Outlier Treatment
-- Create the temporary table and populate it with the lower and upper bounds for each column
CREATE TEMPORARY TABLE temp_stats AS 
SELECT 
    AVG(windSpeed) - 4 * STDDEV(windSpeed) AS lower_windSpeed,
    AVG(windSpeed) + 4 * STDDEV(windSpeed) AS upper_windSpeed,
    AVG(Power) - 4 * STDDEV(Power) AS lower_Power,
    AVG(Power) + 4 * STDDEV(Power) AS upper_Power,
    AVG(NacelleAmbientTemperature) - 4 * STDDEV(NacelleAmbientTemperature) AS lower_NacelleAmbientTemperature,
    AVG(NacelleAmbientTemperature) + 4 * STDDEV(NacelleAmbientTemperature) AS upper_NacelleAmbientTemperature,
    AVG(GeneratorBearingTemperature) - 4 * STDDEV(GeneratorBearingTemperature) AS lower_GeneratorBearingTemperature,
    AVG(GeneratorBearingTemperature) + 4 * STDDEV(GeneratorBearingTemperature) AS upper_GeneratorBearingTemperature,
    AVG(GearOilTemperature) - 4 * STDDEV(GearOilTemperature) AS lower_GearOilTemperature,
    AVG(GearOilTemperature) + 4 * STDDEV(GearOilTemperature) AS upper_GearOilTemperature,
    AVG(AmbientTemperature) - 4 * STDDEV(AmbientTemperature) AS lower_AmbientTemperature,
    AVG(AmbientTemperature) + 4 * STDDEV(AmbientTemperature) AS upper_AmbientTemperature,
    AVG(RotorSpeed) - 4 * STDDEV(RotorSpeed) AS lower_RotorSpeed,
    AVG(RotorSpeed) + 4 * STDDEV(RotorSpeed) AS upper_RotorSpeed,
    AVG(NacelleTemperature) - 4 * STDDEV(NacelleTemperature) AS lower_NacelleTemperature,
    AVG(NacelleTemperature) + 4 * STDDEV(NacelleTemperature) AS upper_NacelleTemperature,
    AVG(BearingTemperature) - 4 * STDDEV(BearingTemperature) AS lower_BearingTemperature,
    AVG(BearingTemperature) + 4 * STDDEV(BearingTemperature) AS upper_BearingTemperature,
    AVG(GeneratorSpeed) - 4 * STDDEV(GeneratorSpeed) AS lower_GeneratorSpeed,
    AVG(GeneratorSpeed) + 4 * STDDEV(GeneratorSpeed) AS upper_GeneratorSpeed,
    AVG(yawAngle) - 4 * STDDEV(yawAngle) AS lower_yawAngle,
    AVG(yawAngle) + 4 * STDDEV(yawAngle) AS upper_yawAngle,
    AVG(WindDirection) - 4 * STDDEV(WindDirection) AS lower_WindDirection,
    AVG(WindDirection) + 4 * STDDEV(WindDirection) AS upper_WindDirection,
    AVG(WheelhubTemperature) - 4 * STDDEV(WheelhubTemperature) AS lower_WheelhubTemperature,
    AVG(WheelhubTemperature) + 4 * STDDEV(WheelhubTemperature) AS upper_WheelhubTemperature,
    AVG(GearboxInletTemperature) - 4 * STDDEV(GearboxInletTemperature) AS lower_GearboxInletTemperature,
    AVG(GearboxInletTemperature) + 4 * STDDEV(GearboxInletTemperature) AS upper_GearboxInletTemperature
FROM dataset;

CREATE TABLE new_temp_stats SELECT * FROM temp_stats;

-- Update the dataset table with winsorized values
UPDATE dataset
SET
    windSpeed = 
        CASE
            WHEN windSpeed < (SELECT lower_windSpeed FROM new_temp_stats) THEN (SELECT lower_windSpeed FROM new_temp_stats)
            WHEN windSpeed > (SELECT upper_windSpeed FROM new_temp_stats) THEN (SELECT upper_windSpeed FROM new_temp_stats)
            ELSE windSpeed
        END,
    Power = 
        CASE
            WHEN Power < (SELECT lower_Power FROM new_temp_stats) THEN (SELECT lower_Power FROM new_temp_stats)
            WHEN Power > (SELECT upper_Power FROM new_temp_stats) THEN (SELECT upper_Power FROM new_temp_stats)
            ELSE Power
        END,
    NacelleAmbientTemperature = 
        CASE
            WHEN NacelleAmbientTemperature < (SELECT lower_NacelleAmbientTemperature FROM new_temp_stats) THEN (SELECT lower_NacelleAmbientTemperature FROM new_temp_stats)
            WHEN NacelleAmbientTemperature > (SELECT upper_NacelleAmbientTemperature FROM new_temp_stats) THEN (SELECT upper_NacelleAmbientTemperature FROM new_temp_stats)
            ELSE NacelleAmbientTemperature
        END,
    GeneratorBearingTemperature = 
        CASE
            WHEN GeneratorBearingTemperature < (SELECT lower_GeneratorBearingTemperature FROM new_temp_stats) THEN (SELECT lower_GeneratorBearingTemperature FROM new_temp_stats)
            WHEN GeneratorBearingTemperature > (SELECT upper_GeneratorBearingTemperature FROM new_temp_stats) THEN (SELECT upper_GeneratorBearingTemperature FROM new_temp_stats)
            ELSE GeneratorBearingTemperature
        END,
    GearOilTemperature = 
        CASE
            WHEN GearOilTemperature < (SELECT lower_GearOilTemperature FROM new_temp_stats) THEN (SELECT lower_GearOilTemperature FROM new_temp_stats)
            WHEN GearOilTemperature > (SELECT upper_GearOilTemperature FROM new_temp_stats) THEN (SELECT upper_GearOilTemperature FROM new_temp_stats)
            ELSE GearOilTemperature
        END,
    AmbientTemperature = 
        CASE
            WHEN AmbientTemperature < (SELECT lower_AmbientTemperature FROM new_temp_stats) THEN (SELECT lower_AmbientTemperature FROM new_temp_stats)
            WHEN AmbientTemperature > (SELECT upper_AmbientTemperature FROM new_temp_stats) THEN (SELECT upper_AmbientTemperature FROM new_temp_stats)
            ELSE AmbientTemperature
        END,
    RotorSpeed = 
        CASE
            WHEN RotorSpeed < (SELECT lower_RotorSpeed FROM new_temp_stats) THEN (SELECT lower_RotorSpeed FROM new_temp_stats)
            WHEN RotorSpeed > (SELECT upper_RotorSpeed FROM new_temp_stats) THEN (SELECT upper_RotorSpeed FROM new_temp_stats)
            ELSE RotorSpeed
        END,
    NacelleTemperature = 
        CASE
            WHEN NacelleTemperature < (SELECT lower_NacelleTemperature FROM new_temp_stats) THEN (SELECT lower_NacelleTemperature FROM new_temp_stats)
            WHEN NacelleTemperature > (SELECT upper_NacelleTemperature FROM new_temp_stats) THEN (SELECT upper_NacelleTemperature FROM new_temp_stats)
            ELSE NacelleTemperature
        END,
    BearingTemperature = 
        CASE
            WHEN BearingTemperature < (SELECT lower_BearingTemperature FROM new_temp_stats) THEN (SELECT lower_BearingTemperature FROM new_temp_stats)
            WHEN BearingTemperature > (SELECT upper_BearingTemperature FROM new_temp_stats) THEN (SELECT upper_BearingTemperature FROM new_temp_stats)
            ELSE BearingTemperature
        END,
    GeneratorSpeed = 
        CASE
            WHEN GeneratorSpeed < (SELECT lower_GeneratorSpeed FROM new_temp_stats) THEN (SELECT lower_GeneratorSpeed FROM new_temp_stats)
            WHEN GeneratorSpeed > (SELECT upper_GeneratorSpeed FROM new_temp_stats) THEN (SELECT upper_GeneratorSpeed FROM new_temp_stats)
            ELSE GeneratorSpeed
        END,
    yawAngle = 
        CASE
            WHEN yawAngle < (SELECT lower_yawAngle FROM new_temp_stats) THEN (SELECT lower_yawAngle FROM new_temp_stats)
            WHEN yawAngle > (SELECT upper_yawAngle FROM new_temp_stats) THEN (SELECT upper_yawAngle FROM new_temp_stats)
            ELSE yawAngle
        END,
    WindDirection = 
        CASE
            WHEN WindDirection < (SELECT lower_WindDirection FROM new_temp_stats) THEN (SELECT lower_WindDirection FROM new_temp_stats)
            WHEN WindDirection > (SELECT upper_WindDirection FROM new_temp_stats) THEN (SELECT upper_WindDirection FROM new_temp_stats)
            ELSE WindDirection
        END,
    WheelhubTemperature = 
        CASE
            WHEN WheelhubTemperature < (SELECT lower_WheelhubTemperature FROM new_temp_stats) THEN (SELECT lower_WheelhubTemperature FROM new_temp_stats)
            WHEN WheelhubTemperature > (SELECT upper_WheelhubTemperature FROM new_temp_stats) THEN (SELECT upper_WheelhubTemperature FROM new_temp_stats)
            ELSE WheelhubTemperature
        END,
    GearboxInletTemperature = 
        CASE
            WHEN GearboxInletTemperature < (SELECT lower_GearboxInletTemperature FROM new_temp_stats) THEN (SELECT lower_GearboxInletTemperature FROM new_temp_stats)
            WHEN GearboxInletTemperature > (SELECT upper_GearboxInletTemperature FROM new_temp_stats) THEN (SELECT upper_GearboxInletTemperature FROM new_temp_stats)
            ELSE GearboxInletTemperature
        END;
drop table new_temp_stats;
drop table temp_stats;