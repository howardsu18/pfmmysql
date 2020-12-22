CREATE DATABASE IF NOT EXISTS `pfm` default character set utf8 collate utf8_general_ci;

use pfm;

-- tables

-- pfm.hibernate_sequence definition

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- pfm.b_salary_input definition
DROP TABLE IF EXISTS `b_salary_input`;
CREATE TABLE `b_salary_input` (
  `input_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  `ei` float DEFAULT NULL,
  `final_money` float NOT NULL,
  `health_insurence` float DEFAULT NULL,
  `pension_insurence` float DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `total_money` float DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `wage_date` datetime(6) DEFAULT NULL,
  `wage_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`input_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;


-- pfm.b_shopping_output definition
DROP TABLE IF EXISTS `b_shopping_output`;
CREATE TABLE `b_shopping_output` (
  `output_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `shopping_date` datetime(6) DEFAULT NULL,
  `shopping_user` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `total_tax` float DEFAULT NULL,
  `type_id` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`output_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;


-- pfm.m_currency definition
DROP TABLE IF EXISTS `m_currency`;
CREATE TABLE `m_currency` (
  `currency_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- pfm.m_inputtype definition
DROP TABLE IF EXISTS `m_inputtype`;
CREATE TABLE `m_inputtype` (
  `input_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`input_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- pfm.m_outputtype definition
DROP TABLE IF EXISTS `m_outputtype`;
CREATE TABLE `m_outputtype` (
  `output_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`output_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- pfm.r_month_report definition
DROP TABLE IF EXISTS `r_month_report`;
CREATE TABLE `r_month_report` (
  `month_report_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cloth_output` double DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `food_output` double DEFAULT NULL,
  `fund_input` double DEFAULT NULL,
  `interest_input` double DEFAULT NULL,
  `invest_input` double DEFAULT NULL,
  `mobility_output` double DEFAULT NULL,
  `month` bigint(20) DEFAULT NULL,
  `net_input` double DEFAULT NULL,
  `other_input` double DEFAULT NULL,
  `other_output` double DEFAULT NULL,
  `real_input` double DEFAULT NULL,
  `resite_output` double DEFAULT NULL,
  `salary_input` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `stock_input` double DEFAULT NULL,
  `study_output` double DEFAULT NULL,
  `total_input` double DEFAULT NULL,
  `total_input_tax` double DEFAULT NULL,
  `total_output` double DEFAULT NULL,
  `total_output_tax` double DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `year` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`month_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- pfm.r_year_report definition
DROP TABLE IF EXISTS `r_year_report`;
CREATE TABLE `r_year_report` (
  `year_report_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cloth_output` double DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `food_output` double DEFAULT NULL,
  `fund_input` double DEFAULT NULL,
  `interest_input` double DEFAULT NULL,
  `invest_input` double DEFAULT NULL,
  `mobility_output` double DEFAULT NULL,
  `net_input` double DEFAULT NULL,
  `other_input` double DEFAULT NULL,
  `other_output` double DEFAULT NULL,
  `real_input` double DEFAULT NULL,
  `resite_output` double DEFAULT NULL,
  `salary_input` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `stock_input` double DEFAULT NULL,
  `study_output` double DEFAULT NULL,
  `total_input` double DEFAULT NULL,
  `total_input_tax` double DEFAULT NULL,
  `total_output` double DEFAULT NULL,
  `total_output_tax` double DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `year` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`year_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- pfm.um_users definition
DROP TABLE IF EXISTS `um_users`;
CREATE TABLE `um_users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `work_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- procedures

DELIMITER //

-- procedures
DROP PROCEDURE IF EXISTS DROPMONTHREPORT //
CREATE PROCEDURE DROPMONTHREPORT(IN YEAR INT, IN MONTH INT )
BEGIN
	DELETE FROM r_month_report WHERE r_month_report.year = YEAR AND r_month_report.month = MONTH;
END //

DROP PROCEDURE IF EXISTS DROPYEARREPORT //
CREATE PROCEDURE DROPYEARREPORT(IN YEAR INT )
BEGIN
	DELETE FROM r_year_report WHERE r_year_report.year = YEAR;
END //

DROP PROCEDURE IF EXISTS RECOUNTMONTHREPORT //
CREATE PROCEDURE RECOUNTMONTHREPORT(IN YEAR INT, IN MONTH INT, IN USER LONG )
BEGIN
	-- define variable for save selected value from tables
	DECLARE totalInput DOUBLE DEFAULT 0.0;
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

	
END //


DROP PROCEDURE IF EXISTS RECOUNTYEARREPORT //
CREATE PROCEDURE RECOUNTYEARREPORT(IN YEAR INT, IN USER LONG )
BEGIN
	-- define variable for save selected value from tables
	DECLARE totalInput DOUBLE DEFAULT 0.0;
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

	
END //

DELIMITER ;


