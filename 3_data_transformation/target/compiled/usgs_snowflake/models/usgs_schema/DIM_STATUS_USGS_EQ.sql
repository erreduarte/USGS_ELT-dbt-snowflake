WITH SOURCE_DATA AS( 
SELECT 
                    ID,
                    REGISTERED_AT,
                    ALERT,
                    STATUS,
                    FELT,
                    CDI,
                    MMI
                FROM
                    EARTHQUAKE_USGS.STG_EARTHQUAKE_DATA.STG_EARTHQUAKE_HISTORY)


SELECT *
FROM
    SOURCE_DATA A1
WHERE NOT EXISTS (
    SELECT
        1
    FROM
        EARTHQUAKE_USGS.EARTHQUAKE_DATA.DIM_STATUS_USGS_EQ A2
    WHERE
        A1.ID = A2.ID
    AND
        A1.REGISTERED_AT = A2.REGISTERED_AT
)