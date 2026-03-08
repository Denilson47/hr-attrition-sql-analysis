-- =========================================
-- KPI 1: Overall Attrition Rate
-- =========================================
SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate_percentage
FROM hr.employee_attrition;

-- =========================================
-- KPI 2: Attrition Rate by Department
-- =========================================
SELECT 
    "Department",
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate_percentage
FROM hr.employee_attrition
GROUP BY "Department"
ORDER BY attrition_rate_percentage DESC;

-- =========================================
-- KPI 3: Attrition Rate by OverTime
-- =========================================
SELECT 
    "OverTime",
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate_percentage
FROM hr.employee_attrition
GROUP BY "OverTime"
ORDER BY attrition_rate_percentage DESC;