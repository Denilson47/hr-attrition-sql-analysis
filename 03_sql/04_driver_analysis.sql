-- ==========================================
-- Driver Analysis 1: Job Role Attrition Rate
-- ==========================================
SELECT
    "JobRole",
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate_percentage
FROM hr.employee_attrition
GROUP BY "JobRole"
ORDER BY attrition_rate_percentage DESC;

-- ==============================================
-- Driver Analysis 2: Income Group Attrition Rate
-- ==============================================
SELECT
    CASE
        WHEN "MonthlyIncome" < 3000 THEN 'Low Income'
        WHEN "MonthlyIncome" BETWEEN 3000 AND 7000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate_percentage
FROM hr.employee_attrition
GROUP BY income_group
ORDER BY attrition_rate_percentage DESC;

-- ==================================================
-- Driver Analysis 3: Job Satisfaction Attrition Rate
-- ==================================================
SELECT
    "JobSatisfaction",
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate_percentage
FROM hr.employee_attrition
GROUP BY "JobSatisfaction"
ORDER BY "JobSatisfaction";

-- ==============================================
-- Driver Analysis 4: Tenure Group Attrition Rate
-- ==============================================
SELECT
    CASE
        WHEN "YearsAtCompany" <= 2 THEN '0–2 Years'
        WHEN "YearsAtCompany" BETWEEN 3 AND 5 THEN '3–5 Years'
        WHEN "YearsAtCompany" BETWEEN 6 AND 10 THEN '6–10 Years'
        ELSE '10+ Years'
    END AS tenure_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate_percentage
FROM hr.employee_attrition
GROUP BY tenure_group
ORDER BY attrition_rate_percentage DESC;