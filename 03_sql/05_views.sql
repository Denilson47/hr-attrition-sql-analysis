-- =============================
-- View 1: Overall Attrition KPI
-- =============================
CREATE OR REPLACE VIEW hr.v_attrition_kpi AS
SELECT 
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate_percentage
FROM hr.employee_attrition;

-- ============================
-- View 2: Department Attrition
-- ============================
CREATE OR REPLACE VIEW hr.v_department_attrition AS
SELECT 
    "Department",
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate_percentage
FROM hr.employee_attrition
GROUP BY "Department"
ORDER BY attrition_rate_percentage DESC;

-- ==========================
-- View 3: Overtime Attrition
-- ==========================
CREATE OR REPLACE VIEW hr.v_overtime_attrition AS
SELECT 
    "OverTime",
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate_percentage
FROM hr.employee_attrition
GROUP BY "OverTime"
ORDER BY attrition_rate_percentage DESC;