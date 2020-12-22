use `pfm`;

-- procedures
DROP PROCEDURE IF EXISTS DROPMONTHREPORT;
CREATE PROCEDURE DROPMONTHREPORT(IN YEAR INT, IN MONTH INT )
BEGIN
	DELETE FROM r_month_report WHERE r_month_report.year = YEAR AND r_month_report.month = MONTH;
END;

DROP PROCEDURE IF EXISTS DROPYEARREPORT;
CREATE PROCEDURE DROPYEARREPORT(IN YEAR INT )
BEGIN
	DELETE FROM r_year_report WHERE r_year_report.year = YEAR;
END;

DROP PROCEDURE IF EXISTS RECOUNTMONTHREPORT;
CREATE PROCEDURE RECOUNTMONTHREPORT(IN YEAR INT, IN MONTH INT, IN USER LONG )
BEGIN
	-- define variable for save selected value from tables
	DECLARE	totalInput DOUBLE DEFAULT 0.0;
	DECLARE totalInputTax DOUBLE DEFAULT 0.0;
	DECLARE netInput DOUBLE DEFAULT 0.0;
	DECLARE salaryInput DOUBLE DEFAULT 0.0;
	DECLARE stockInput DOUBLE DEFAULT 0.0;
	DECLARE fundInput DOUBLE DEFAULT 0.0;
	DECLARE interestInput DOUBLE DEFAULT 0.0;
	DECLARE realInput DOUBLE DEFAULT 0.0;
	DECLARE investInput DOUBLE DEFAULT 0.0;
	DECLARE otherInput DOUBLE DEFAULT 0.0;

	DECLARE totalOutput DOUBLE DEFAULT 0.0;
	DECLARE totalOutputTax DOUBLE DEFAULT 0.0;
	DECLARE foodOutput DOUBLE DEFAULT 0.0;
	DECLARE resiteOutput DOUBLE DEFAULT 0.0;
	DECLARE clothOutput DOUBLE DEFAULT 0.0;
	DECLARE mobilityOutput DOUBLE DEFAULT 0.0;
	DECLARE studyOutput DOUBLE DEFAULT 0.0;
	DECLARE otherOutput DOUBLE DEFAULT 0.0;


	DECLARE tempTotalInput	DOUBLE DEFAULT 0.0;
	DECLARE tempTotalInputTax DOUBLE DEFAULT 0.0;
	DECLARE tempNetInput DOUBLE DEFAULT 0.0;

	DECLARE tempTotalOutput DOUBLE DEFAULT 0.0;
	DECLARE tempTotalOutputTax DOUBLE DEFAULT 0.0;

	-- delete all record for same year and month
	CALL pfm.DROPMONTHREPORT(YEAR, MONTH);

	-- get value for salary input
	SELECT 	@tempTotalInput := IFNULL(SUM(total_money), 0.0), 
			@tempTotalInputTax := IFNULL(SUM(0.0), 0.0),
			@tempNetInput := IFNULL(SUM(final_money), 0.0),
			@salaryInput := IFNULL(SUM(final_money), 0.0)
	FROM b_salary_input
	WHERE YEAR(wage_date) = YEAR
	AND MONTH(wage_date) = MONTH;

	SET	totalInput := totalInput + @tempTotalInput;
	SET totalInputTax := totalInputTax + @tempTotalInputTax;
	SET netInput := netInput + @tempNetInput;

	-- get value for shopping output
	SELECT 	@tempTotalOutput := IFNULL(SUM(total_price), 0.0),
			@tempTotalOutputTax := IFNULL(SUM(total_tax), 0.0)
	FROM b_shopping_output
	WHERE YEAR(shopping_date) = YEAR
	AND MONTH(shopping_date) = MONTH;

	SET	totalOutput := totalOutput + @tempTotalOutput;
	SET totalOutputTax := totalOutputTax + @tempTotalOutputTax;
		
	INSERT INTO r_month_report 
	(  
-- 	  `month_report_id`,
	  year,
	  month,
	  total_input,
	  total_input_tax,
	  net_input,
	  salary_input,
	  interest_input,
	  fund_input,
	  invest_input,
	  real_input,
	  other_input,
	  stock_input,
	  total_output,
	  total_output_tax,
	  other_output,
	  cloth_output,
	  food_output,
	  resite_output,
	  mobility_output,
	  study_output,
	  status,
	  create_date,
	  create_user,
	  update_date,
	  update_user
	 )
	VALUES
	(
-- 		LAST_INSERT_ID(),
		YEAR,
		MONTH,
		
		totalInput,
		totalInputTax,
		netInput,

		@salaryInput,
		interestInput,
		fundInput,
		investInput,
		realInput,
		otherInput,
		stockInput,
		
		totalOutput,
		totalOutputTax,

		otherOutput,
		clothOutput,
		foodOutput,
		resiteOutput,
		mobilityOutput,
		studyOutput,
		1,
		NOW(),
		IFNULL(USER, 2),
		NOW(),
		IFNULL(USER, 2)
	);

	
END;


DROP PROCEDURE IF EXISTS RECOUNTYEARREPORT;
CREATE ROCEDURE RECOUNTYEARREPORT(IN YEAR INT, IN USER LONG )
BEGIN
	-- define variable for save selected value from tables
	DECLARE	totalInput DOUBLE DEFAULT 0.0;
	DECLARE totalInputTax DOUBLE DEFAULT 0.0;
	DECLARE netInput DOUBLE DEFAULT 0.0;
	DECLARE salaryInput DOUBLE DEFAULT 0.0;
	DECLARE stockInput DOUBLE DEFAULT 0.0;
	DECLARE fundInput DOUBLE DEFAULT 0.0;
	DECLARE interestInput DOUBLE DEFAULT 0.0;
	DECLARE realInput DOUBLE DEFAULT 0.0;
	DECLARE investInput DOUBLE DEFAULT 0.0;
	DECLARE otherInput DOUBLE DEFAULT 0.0;

	DECLARE totalOutput DOUBLE DEFAULT 0.0;
	DECLARE totalOutputTax DOUBLE DEFAULT 0.0;
	DECLARE foodOutput DOUBLE DEFAULT 0.0;
	DECLARE resiteOutput DOUBLE DEFAULT 0.0;
	DECLARE clothOutput DOUBLE DEFAULT 0.0;
	DECLARE mobilityOutput DOUBLE DEFAULT 0.0;
	DECLARE studyOutput DOUBLE DEFAULT 0.0;
	DECLARE otherOutput DOUBLE DEFAULT 0.0;


	DECLARE tempTotalInput	DOUBLE DEFAULT 0.0;
	DECLARE tempTotalInputTax DOUBLE DEFAULT 0.0;
	DECLARE tempNetInput DOUBLE DEFAULT 0.0;

	DECLARE tempTotalOutput DOUBLE DEFAULT 0.0;
	DECLARE tempTotalOutputTax DOUBLE DEFAULT 0.0;

	-- delete all record for same year and month
	CALL DROPYEARREPORT(YEAR);

	-- get value for salary input
	SELECT 	@tempTotalInput := IFNULL(SUM(total_money), 0.0), 
			@tempTotalInputTax := IFNULL(SUM(0.0), 0.0),
			@tempNetInput := IFNULL(SUM(final_money), 0.0),
			@salaryInput := IFNULL(SUM(final_money), 0.0)
	FROM b_salary_input
	WHERE YEAR(wage_date) = YEAR;

	SET	totalInput := totalInput + @tempTotalInput;
	SET totalInputTax := totalInputTax + @tempTotalInputTax;
	SET netInput := netInput + @tempNetInput;

	-- get value for shopping output
	SELECT 	@tempTotalOutput := IFNULL(SUM(total_price), 0.0),
			@tempTotalOutputTax := IFNULL(SUM(total_tax), 0.0)
	FROM b_shopping_output
	WHERE YEAR(shopping_date) = YEAR;

	SET	totalOutput := totalOutput + @tempTotalOutput;
	SET totalOutputTax := totalOutputTax + @tempTotalOutputTax;
		
	INSERT INTO r_year_report 
	(  
-- 	  `month_report_id`,
	  year,
-- 	  `month`,
	  total_input,
	  total_input_tax,
	  net_input,
	  salary_input,
	  interest_input,
	  fund_input,
	  invest_input,
	  real_input,
	  other_input,
	  stock_input,
	  total_output,
	  total_output_tax,
	  other_output,
	  cloth_output,
	  food_output,
	  resite_output,
	  mobility_output,
	  study_output,
	  status,
	  create_date,
	  create_user,
	  update_date,
	  update_user
	 )
	VALUES
	(
-- 		LAST_INSERT_ID(),
		YEAR,
-- 		MONTH,
		
		totalInput,
		totalInputTax,
		netInput,

		@salaryInput,
		interestInput,
		fundInput,
		investInput,
		realInput,
		otherInput,
		stockInput,
		
		totalOutput,
		totalOutputTax,

		otherOutput,
		clothOutput,
		foodOutput,
		resiteOutput,
		mobilityOutput,
		studyOutput,
		1,
		NOW(),
		IFNULL(USER, 2),
		NOW(),
		IFNULL(USER, 2)
	);

	
END;
