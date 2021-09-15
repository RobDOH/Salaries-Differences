/**
-- required columns:id,salary,department
-- Output: difference_in_salaries
**/
SELECT 
    (SELECT 
        DISTINCT MAX(e.salary) OVER (PARTITION BY d.department)--Used PARTITION instead GROUP
        FROM db_employee e  
        JOIN db_dept d 
        ON e.department_id = d.id
        WHERE d.id = '4')  
        - --MINUS used to Select difference of highest salaries between two departments
    (SELECT 
        DISTINCT MAX(e.salary) OVER (PARTITION BY d.department)
        FROM db_employee e  
        JOIN db_dept d 
        ON e.department_id = d.id
        WHERE d.id = '1') 
    AS salary_difference