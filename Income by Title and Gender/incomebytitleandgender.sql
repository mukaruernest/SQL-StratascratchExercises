WITH
    sf_bonus
    AS
    (
        SELECT worker_ref_id, SUM(bonus) AS bonuses, bonus_date
        FROM sf_bonus
        GROUP BY worker_ref_id, bonus_date
    )
SELECT e.employee_title, e.sex, AVG(e.salary + b.bonuses) AS Averagetotalcompensation
FROM sf_bonus b
    INNER JOIN sf_employee e ON b.worker_ref_id = e.id
GROUP BY e.employee_title, e.sex