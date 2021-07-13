WITH
    combinedtable
    AS
    (
            SELECT *
            FROM fb_eu_energy
        UNION ALL
            SELECT *
            FROM fb_asia_energy
        UNION ALL
            SELECT *
            FROM fb_na_energy
    ),
    totalenergy
    AS
    (
        SELECT date, SUM(consumption) AS  totalconsumption
        FROM combinedtable
        GROUP BY date
    ),
    maxconsumption
    AS
    (
        SELECT MAX(totalconsumption) AS Maxconsumption
        FROM totalenergy
    )
SELECT totalenergy.date, maxconsumption.Maxconsumption
FROM totalenergy
    INNER JOIN maxconsumption ON totalenergy.totalconsumption = maxconsumption.Maxconsumption




