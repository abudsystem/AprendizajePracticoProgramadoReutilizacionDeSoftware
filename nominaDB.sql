--=======================================
--	CREACI�N BASE DE DATOS 
--=======================================
CREATE DATABASE empleados_db
Go

USE empleados_db
Go


--=========================================
--	CREACI�N DE TABLAS
--=========================================
-- Tabla departments
CREATE TABLE departments(
	dept_no		INT		PRIMARY KEY		IDENTITY(1, 1),
	dept_name	VARCHAR(50)		NOT NULL
)
Go

-- Tabla employees
CREATE TABLE employees(
	emp_no		INT		PRIMARY KEY		IDENTITY(1, 1),
	ci			VARCHAR(50)		NOT NULL,
	birth_date	VARCHAR(50)		NOT NULL,
	first_name	VARCHAR(50)		NOT NULL,
	last_name	VARCHAR(50)		NOT NULL,
	gender		CHAR(1)			NOT NULL,
	hire_date	VARCHAR(50)		NOT NULL
)
Go

-- Tabla dept_manager
CREATE TABLE dept_manager(
	emp_no		INT				NOT NULL,
	dept_no		INT				NOT NULL,
	from_date	VARCHAR(50)		NOT NULL,
	to_date		VARCHAR(50)		NOT NULL,
	PRIMARY KEY	(emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
		ON DELETE CASCADE	ON UPDATE CASCADE
)
Go


-- Tabla dept_emp
CREATE TABLE dept_emp(
	emp_no		INT				NOT NULL,
	dept_no		INT				NOT NULL,
	from_date	VARCHAR(50)		NOT NULL,
	to_date		VARCHAR(50)		NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
		ON DELETE CASCADE	ON UPDATE CASCADE
)
Go

-- Table titles (cargos)
CREATE TABLE titles(
	emp_no		INT				NOT NULL,
	title		VARCHAR(50)		NOT NULL,
	from_date	VARCHAR(50)		NOT NULL,
	to_date		VARCHAR(50)		NOT NULL,
	PRIMARY KEY (emp_no, title, from_date),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
		ON DELETE CASCADE	ON UPDATE CASCADE
)
Go

-- Tabla salaries
CREATE TABLE salaries(
	emp_no		INT			NOT NULL,
	salary		BIGINT		NOT NULL,
	from_date	VARCHAR(50)	NOT NULL,
	to_date		VARCHAR(50) NOT NULL,
	PRIMARY KEY (emp_no, from_date),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
		ON DELETE CASCADE	ON UPDATE CASCADE
)
Go

CREATE TABLE users(
	id_usuario int identity(1, 1) primary key,
	emp_no int not null,
	usuario varchar(150) not null,
	clave varchar(20) not null,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
)
Go

--===========================
-- Inserci�n de Datos
--==========================?
INSERT INTO departments (dept_name) 
VALUES
	('Finanzas'), 
	('Marketing'),
	('Ventas'),
	('Atenci�n al Cliente'),
	('Tecnolog�a'),
	('Comunicaciones'),
	('Data Analytics'),
	('Recursos Humanos'),
	('Legal'),
	('Seguridad')
Go

-- Tabla employees
INSERT INTO employees (ci, birth_date, first_name, last_name, gender, hire_date)
VALUES
    ('1708913678', '09/12/1982', 'Erika', 'Rubiales', 'F', '10/09/2018'),
    ('1702384512', '17/03/1990', 'Carlos', 'Lozano', 'M', '10/09/2018'),
    ('0609674321', '22/07/1985', 'Luc�a', 'Mart�nez', 'F', '01/06/2019'),
    ('0601247839', '05/11/1992', 'Diego', 'Paredes', 'M', '18/03/2020'),
    ('1709846732', '30/09/1988', 'Sof�a', 'Mendoza', 'F', '12/11/2019'),
    ('1702389671', '15/04/1979', 'Marcos', 'G�mez', 'M', '10/09/2018'),
    ('0602876543', '11/05/1995', 'Natalia', 'Salinas', 'F', '25/02/2021'),
    ('1709654871', '26/01/1986', 'Javier', 'Herrera', 'M', '14/10/2021'),
    ('1709328475', '19/10/1991', 'Camila', 'R�os', 'F', '07/05/2019'),
    ('0602389472', '03/08/1983', 'Alejandro', 'Crespo', 'M', '22/12/2018'),
    ('0601283745', '14/06/1989', 'Valentina', 'Moreno', 'F', '09/04/2019'),
    ('1709765432', '27/02/1984', 'Andr�s', 'Peralta', 'M', '10/09/2018'),
    ('0603847629', '09/09/1993', 'Elena', 'Navarro', 'F', '30/01/2022'),
    ('0608473659', '01/12/1987', 'Luis', 'Serrano', 'M', '11/09/2018'),
    ('1701238746', '20/04/1996', 'Fernanda', 'Silva', 'F', '17/06/2023'),
    ('1709384756', '06/03/1981', 'Manuel', 'Vera', 'M', '18/09/2018'),
    ('0602398476', '13/01/1990', 'Gabriela', 'Delgado', 'F', '15/09/2018'),
    ('1704758392', '07/10/1985', 'Iv�n', 'Zamora', 'M', '23/09/2018'),
    ('1709348572', '29/11/1983', 'Patricia', 'Acosta', 'F', '22/09/2018'),
    ('0602847561', '04/07/1982', 'Tom�s', 'Carrillo', 'M', '12/09/2018'),
	('1701947352', '15/03/2000', 'Ismael', 'Cede�o', 'M', '10/01/2021'),
    ('0602847932', '28/09/1991', 'Roc�o', 'Espinoza', 'F', '12/09/2018'),
    ('1703849576', '11/06/1987', 'Pedro', 'Ruiz', 'M', '20/05/2022'),
    ('0609837452', '23/07/1995', 'Mar�a', 'Qui��nez', 'F', '09/03/2019'),
    ('1705748392', '02/01/2001', 'Kevin', 'Ch�vez', 'M', '17/11/2022'),
    ('0602948573', '17/10/1989', 'Lorena', 'Mu�oz', 'F', '28/09/2018'),
    ('1709483746', '19/04/2002', 'Dayana', 'Pico', 'F', '10/02/2023'),
    ('0603748569', '09/08/1984', 'Mauricio', 'Villacorta', 'M', '15/12/2018'),
    ('1703829471', '06/05/1990', 'Tatiana', 'Guam�n', 'F', '13/10/2018'),
    ('0601928743', '29/12/1993', '�lvaro', 'Corozo', 'M', '03/03/2020');
Go

-- Tabla dept_managers
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
VALUES
	(1, 1, '10/09/2018', '31/12/2050'),
	(2, 3, '10/09/2018', '31/12/2050'),
	(3, 1, '01/06/2019', '30/12/2024'),
	(4, 1, '18/03/2020', '31/12/2050'),
	(5, 2, '12/11/2019', '10/09/2023'),
	(5, 3, '11/09/2023', '31/12/2050'),
	(6, 2, '10/09/2018', '31/12/2050'),
	(7, 4, '25/02/2021', '31/12/2050'),
	(8, 7, '14/10/2021', '31/12/2050'),
	(9, 3, '07/05/2019', '31/12/2050'),
	(10, 9, '22/12/2018', '30/01/2024'),
	(11, 8, '09/04/2019', '12/12/2021'),
	(12, 4, '10/09/2018', '31/12/2050'),
	(13, 5, '30/01/22', '31/12/2050'),
	(14, 5, '11/09/2018', '31/12/2050'),
	(15, 9, '17/06/2023', '31/12/2050'),
	(16, 10, '18/09/2018', '31/12/2022'),
	(17, 9, '15/09/2018', '30/06/2025'),
	(18, 10, '23/09/2018', '31/12/2050'),
	(19, 9, '22/09/2018', '31/12/2050'),
	(20, 6, '12/09/2018', '31/12/2050'),
	(21, 8, '10/01/2021', '31/12/2050'),
	(22, 7, '12/09/2018', '20/07/2020'),
	(23, 6, '20/05/2022', '31/12/2050'),
	(24, 6, '09/03/2019', '01/04/2025'),
	(25, 7, '17/11/2022', '31/12/2050'),
	(26, 7, '28/09/2018', '31/12/2050'),
	(27, 3, '10/02/2023', '30/05/2025'),
	(28, 8, '15/09/2018', '31/12/2050'),
	(29, 1, '13/10/2018', '31/12/2050'),
	(30, 1, '03/03/2020', '04/12/2022'),
	(30, 3, '05/12/2022', '31/12/2050')
Go	

-- Tabla dept_managers
INSERT INTO dept_manager (emp_no, dept_no, from_date, to_date)
VALUES
	(1, 1, '10/09/2018', '31/12/2050'),
	(6, 2, '10/09/2018', '31/12/2050'),
	(2, 3, '10/09/2018', '31/12/2050'),
	(12, 4, '10/09/2018', '31/12/2050'),
	(14, 5, '11/09/2018', '31/12/2050'),
	(20, 6, '12/09/2018', '31/12/2050'),
	(22, 7, '12/09/2018', '20/07/2022'),
	(26, 7, '20/07/2022', '31/12/2050'),
	(28, 8, '15/09/2018', '31/12/2050'),
	(17, 9, '15/09/2018', '30/06/2025'),
	(19, 9, '01/07/2025', '31/12/2050'),
	(18, 10, '23/09/2018', '31/12/2050')
Go	

-- Tabla titles
INSERT INTO titles (emp_no, title, from_date, to_date)
VALUES
	(1, 'Director Financiero', '10/09/2018', '31/12/2050'),
	(2, 'Director Ventas', '10/09/2018', '31/12/2050'),
	(5, 'Analista de Publicidad', '12/11/2019', '10/09/2023'),
	(5, 'Ejecutivo de Ventas', '11/09/2023', '31/12/2050'),
	(3, 'Auxiliar Contable', '01/06/2019', '31/12/2050'),
	(13, 'Desarrollador Front-End', '30/01/2022', '22/08/2024'),
	(18, 'Director de Seguridad', '23/09/2018', '31/12/2050'),
	(4, 'Analista Financiero', '18/03/2020', '31/12/2050'),
	(13, 'Desarrollador Full Stack', '23/08/2024', '31/12/2050'),
	(6, 'Director de Marketing', '10/09/2018', '31/12/2050'),
	(7, 'Supervisor de Atenci�n al Cliente', '25/02/2021', '31/12/2050'),
	(26, 'Director de Data Analytics', '20/07/2022', '31/12/2050'),
	(26, 'Data Scientist Sr', '28/09/2018', '18/07/2022'),
	(8, 'Data Analyst Jr', '14/10/2021', '20/02/2023'),
	(8, 'Data Analyst Ssr', '21/02/2023', '30/12/2023'),
	(8, 'Data Scientist Ssr', '01/01/2024', '31/12/2050')
Go

-- Tabla salaries
INSERT INTO salaries (emp_no, salary, from_date, to_date)
VALUES
  (1, 4600, '10/09/2018', '31/12/2050'),  
  (2, 4200, '10/09/2018', '31/12/2050'),  
  (5, 1650, '12/11/2019', '10/09/2023'),  
  (5, 2300, '11/09/2023', '31/12/2050'),  
  (3, 1350, '01/06/2019', '31/12/2050'),  
  (13, 2250, '30/01/2022', '22/08/2024'), 
  (13, 2700, '23/08/2024', '31/12/2050'), 
  (18, 4400, '23/09/2018', '31/12/2050'), 
  (4, 2100, '18/03/2020', '31/12/2050'),  
  (6, 4000, '10/09/2018', '31/12/2050'),  
  (7, 1900, '25/02/2021', '31/12/2050'),  
  (26, 4700, '20/07/2022', '31/12/2050'), 
  (26, 2600, '28/09/2018', '18/07/2022'), 
  (8, 1250, '14/10/2021', '20/02/2023'),  
  (8, 1550, '21/02/2023', '30/12/2023'),  
  (8, 2200, '01/01/2024', '31/12/2050');  
Go

  --- Agregando la seccion correo en la tabla employees
  select * from employees
  ALTER TABLE employees	ADD correo varchar(100) NULL
Go

UPDATE employees
SET correo = CONCAT(
    LOWER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
        first_name,
        '�', 'A'), '�', 'E'), '�', 'I'), '�', 'O'), '�', 'U'),
        '�', 'a'), '�', 'e'), '�', 'i'), '�', 'o'), '�', 'u')
    ),
    '.',
    LOWER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
        last_name,
        '�', 'A'), '�', 'E'), '�', 'I'), '�', 'O'), '�', 'U'),
        '�', 'a'), '�', 'e'), '�', 'i'), '�', 'o'), '�', 'u')
    ),
    '@correo.com'
)
WHERE correo IS NULL;
Go

-- Insercion de usuario







-- OBJETOS

/*Generar un informa de todos los empleados de la empresa
incluye su ci, nombre, apellido y fecha de ingreso*/

CREATE OR ALTER VIEW VW_EMPLOYEES_REPRT AS
	SELECT
		ci,
		first_name,
		last_name,
		hire_date
	FROM
		employees
GO

-- Generar un informe de todos los empleados que ganen mas de $2000
CREATE OR ALTER VIEW VW_SALARY_REPORT AS
SELECT
	e.emp_no, 
	e.first_name,
	e.last_name,
	s.from_date,
	s.to_date
FROM
	(
		SELECT *,
			ROW_NUMBER() OVER (PARTITION BY s.emp_no ORDER BY s.from_date DESC) AS rn
		FROM salaries s
		WHERE salary > 2000
	) AS s
JOIN employees e ON e.emp_no = s.emp_no
WHERE s.rn = 1 
GO

/*====================================
�		STORED PROCEDURES
=====================================*/
CREATE OR ALTER PROCEDURE sp_departmentInformation 
AS
	select * from departments
GO

-- Visualizar todos los cargos que ha obtenido un empleado

CREATE OR ALTER PROCEDURE sp_EmployeesTitles @ci varchar(50) AS
SELECT
	e.first_name, e.last_name,
	t.title, t.from_date, t.to_date
FROM employees e
INNER JOIN titles t
ON e.emp_no = t.emp_no
WHERE e.ci = @ci
GO

EXEC sp_EmployeesTitles '1709846732'
GO

-- Simular la actualizacion del salario de un empleado

-- Parametros
--	ci
--	salary
--	message

CREATE OR ALTER PROCEDURE sp_salaryUpdate
	@emp_no INT,
	@salary INT,
	@message varchar(150) output
AS
	BEGIN
		--validacion de xistencia de usuario
		IF NOT EXISTS (SELECT * FROM employees WHERE emp_no = emp_no)
			BEGIN
				SET @message = 'No existe registro del empleado'
			END
		ELSE 
			BEGIN
				IF NOT EXISTS (SELECT * FROM salaries WHERE emp_no=emp_no)
					BEGIN
						INSERT INTO salaries (emp_no, salary, from_date, to_date)
						VALUES
							(@emp_no, 1795, CONVERT(VARCHAR(50), GETDATE(), 103), CONVERT(VARCHAR(50), GETDATE()+1000, 103))
						set @message = 'El salario del empleado ha sido agregado'
					END
				ELSE
					BEGIN
						UPDATE salaries
						SET salary = @salary WHERE emp_no = @emp_no

						set @message = 'El salario del empleado ha sido actualizado'
					END
			END
	END
GO

declare @mensaje varchar(150)
exec sp_SalaryUpdate 2, 4500, @mensaje output
select @mensaje

select * from salaries
GO


CREATE OR ALTER PROCEDURE sp_salaryTitles
@emp_no INT,
@message VARCHAR(250) output
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM employees WHERE emp_no = @emp_no)
		BEGIN
			SET @message = 'Empleado no encontrado'
		END
	ELSE
		BEGIN
			SELECT
				e.first_name,
				e.last_name,
				t.title,
				t.from_date AS title_from,
				t.to_date AS title_to,
				s.salary,
				s.from_date AS salary_from,
			    s.to_date AS salary_to
			FROM employees e
			INNER JOIN titles t
			ON e.emp_no = t.emp_no
			INNER JOIN salaries s
			ON e.emp_no = s.emp_no
				AND s.from_date <= t.to_date
				AND s.to_date >= t.from_date
			WHERE e.emp_no = @emp_no
		END

END
go

declare @message varchar(250)
exec sp_salaryTitles 8, @message output
select @message

-- TRIGGERS
-- Accion sobre una tabla (UPDATE, DELETE, INSERT, SELECT)
-- Antes o despues de realizar la accion sobre la tabla
-- generalmente sirve para insertar informacion en la tabla
-- utiles en controles de auditoria

-- RF02: Cada vez que se cree un registro del salario de un empleado, necesito conocer la auditoria de quien crea el registro

-- Quien hizo el cambio
-- cuando lo hizo
-- cual fue el cambio

	-- usuario
	-- fecha de cambio
	-- detalle del cambio
	-- salario cambiado
	-- codigo del empleado

CREATE TABLE log_auditorySalary(
	id int identity(1, 1) primary key,
	username varchar(50) not null,
	update_date date not null,
	change_detail varchar(250) not null,
	salary bigint not null,
	emp_no int not null
)
GO
-- creacion del trigger
CREATE OR ALTER TRIGGER tr_employeeChangeSalary
	on salaries
	after insert
AS
	BEGIN
		DECLARE @salary bigint
		DECLARE @emp_no int

		--tomando los valores durante la accion en la tabla
		set @emp_no = (SELECT emp_no FROM inserted)
		set @salary = (SELECT salary FROM inserted)

		-- insertar datos en la tabla de auditoria de salarios
		INSERT INTO log_auditorySalary (username, update_date, change_detail, salary, emp_no)
		VALUES
			(SUSER_SNAME(), GETDATE(), 'Nuevo empleado', @salary, @emp_no)
	END
GO

INSERT INTO employees (ci, birth_date, first_name, last_name, gender, hire_date)
VALUES
    ('1708913621', '1998-07-12', 'Daniela', 'Albertoni', 'F', Getdate())

INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
VALUES
	(31, 5, getdate(), '2050-12-31')

INSERT INTO titles (emp_no, title, from_date, to_date)
VALUES
	(31, 'Analista de TI', getdate(), '2050-12-31')

INSERT INTO salaries (emp_no, salary, from_date, to_date)
VALUES
  (31, 1700, getdate(), '2050-12-31')

select * from salaries where emp_no = 31
select * from log_auditorySalary
Go


-- Procedure para Autenticacion de usuarios

