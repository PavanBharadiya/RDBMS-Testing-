#PostgreSQL

create table BRANCH(
	Branch_Code varchar PRIMARY KEY,
	Branch_Name varchar NOT NULL,
	Branch_Address1 varchar NOT NULL,
	Branch_City varchar NOT NULL,
	Branch_State varchar NOT NULL,
	Branch_PINCODE varchar NOT NULL
);

create table CUSTOMER(
	Cust_ID varchar PRIMARY KEY,
	Branch_Code varchar NOT NULL,
	Cust_FirstName varchar NOT NULL,
	Cust_MiddleName varchar,
	Cust_LastName varchar NOT NULL,
	Cust_username varchar NOT NULL UNIQUE,
	Cust_DOB varchar NOT NULL,
	Cust_email varchar NOT NULL UNIQUE,
	Cust_passwd varchar NOT NULL,
	Cust_Gender varchar NOT NULL,
	Cust_Address1 varchar NOT NULL,
	Cust_City varchar NOT NULL,
	Cust_State varchar NOT NULL,
	Cust_PINCODE varchar NOT NULL,
	PasswdLastUpdatedDate varchar NOT NULL
);

create table ACCOUNT(
	Acc_No varchar PRIMARY KEY,
	Branch_Code varchar NOT NULL,
	Cust_ID varchar NOT NULL,
	Acc_Type varchar NOT NULL,
	Acc_Balance varchar NOT NULL,
	LastTransactionTime varchar NOT NULL,
	LastQrtrFeeDeductDate varchar NOT NULL,
	Transaction_count varchar NOT NULL,
	credit_score varchar NOT NULL
);

create table TRANSACTION(
	Tx_ID varchar PRIMARY KEY,
	Branch_Code varchar NOT NULL,
	Acc_No varchar NOT NULL,
	Cust_ID varchar NOT NULL,
	Tx_type varchar NOT NULL,
	Tx_time varchar NOT NULL,
	Tx_desc varchar NOT NULL,
	Acc_Balance varchar NOT NULL,
	Tx_amount varchar NOT NULL
);

create table premium_ACCOUNT(
	Acc_No varchar PRIMARY KEY,
	Branch_Code varchar NOT NULL,
	Cust_ID varchar NOT NULL,
	Acc_Type varchar NOT NULL,
	Acc_Balance varchar NOT NULL,
	LastTransactionTime varchar NOT NULL,
	LastQrtrFeeDeductDate varchar NOT NULL,
	Transaction_count varchar NOT NULL,
	credit_score varchar NOT NULL
);

create table penalty_ACCOUNT(
	Acc_No varchar PRIMARY KEY,
	Branch_Code varchar NOT NULL,
	Cust_ID varchar NOT NULL,
	Acc_Type varchar NOT NULL,
	Acc_Balance varchar NOT NULL,
	LastTransactionTime varchar NOT NULL,
	LastQrtrFeeDeductDate varchar NOT NULL,
	Transaction_count varchar NOT NULL,
	credit_score varchar NOT NULL
);

create table dormant_ACCOUNT(
	Acc_No varchar PRIMARY KEY,
	Branch_Code varchar NOT NULL,
	Cust_ID varchar NOT NULL,
	Acc_Type varchar NOT NULL,
	Acc_Balance varchar NOT NULL,
	LastTransactionTime varchar NOT NULL,
	LastQrtrFeeDeductDate varchar NOT NULL,
	Transaction_count varchar NOT NULL,
	credit_score varchar NOT NULL
);

create table special_ACCOUNT(
	Acc_No varchar PRIMARY KEY,
	Branch_Code varchar NOT NULL,
	Cust_ID varchar NOT NULL,
	Acc_Type varchar NOT NULL,
	Acc_Balance varchar NOT NULL,
	LastTransactionTime varchar NOT NULL,
	LastQrtrFeeDeductDate varchar NOT NULL,
	Transaction_count varchar NOT NULL,
	credit_score varchar NOT NULL
);



ALTER TABLE customer
ADD CONSTRAINT cust_branch_fk FOREIGN KEY (branch_code) REFERENCES branch (branch_code) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE account
ADD CONSTRAINT acc_branch_fk FOREIGN KEY (branch_code) REFERENCES branch (branch_code) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE account
ADD CONSTRAINT acc_cust_fk FOREIGN KEY (cust_id) REFERENCES customer (cust_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE transaction
ADD CONSTRAINT tx_branch_fk FOREIGN KEY (branch_code) REFERENCES branch (branch_code) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE transaction
ADD CONSTRAINT tx_cust_fk FOREIGN KEY (cust_id) REFERENCES customer (cust_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE transaction
ADD CONSTRAINT tx_acc_fk FOREIGN KEY (acc_no) REFERENCES account (acc_no) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE premium_account
ADD CONSTRAINT premium_branch_fk FOREIGN KEY (branch_code) REFERENCES branch (branch_code) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE premium_account
ADD CONSTRAINT premium_cust_fk FOREIGN KEY (cust_id) REFERENCES customer (cust_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE premium_account
ADD CONSTRAINT premium_acc_fk FOREIGN KEY (acc_no) REFERENCES account (acc_no) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE penalty_account
ADD CONSTRAINT penalty_branch_fk FOREIGN KEY (branch_code) REFERENCES branch (branch_code) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE penalty_account
ADD CONSTRAINT penalty_cust_fk FOREIGN KEY (cust_id) REFERENCES customer (cust_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE penalty_account
ADD CONSTRAINT penalty_acc_fk FOREIGN KEY (acc_no) REFERENCES account (acc_no) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE dormant_account
ADD CONSTRAINT dormant_branch_fk FOREIGN KEY (branch_code) REFERENCES branch (branch_code) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE dormant_account
ADD CONSTRAINT dormant_cust_fk FOREIGN KEY (cust_id) REFERENCES customer (cust_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE dormant_account
ADD CONSTRAINT dormant_acc_fk FOREIGN KEY (acc_no) REFERENCES account (acc_no) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE special_account
ADD CONSTRAINT special_branch_fk FOREIGN KEY (branch_code) REFERENCES branch (branch_code) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE special_account
ADD CONSTRAINT special_cust_fk FOREIGN KEY (cust_id) REFERENCES customer (cust_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE special_account
ADD CONSTRAINT special_acc_fk FOREIGN KEY (acc_no) REFERENCES account (acc_no) ON UPDATE CASCADE ON DELETE CASCADE;

INSERT INTO branch (Branch_Code, Branch_Name, Branch_Address1, Branch_City, Branch_State, Branch_PINCODE) VALUES
    ('A1B2', 'ECITY', '26/c, hosur road', 'Bengaluru', 'karnataka', '560100'),
    ('C1D2', 'NDL', 'A/2, CP', 'New Delhi', 'Delhi', '110001'),
    ('E1F2', 'AHMDBD', 'B/2, random chowk', 'Ahemedabad', 'Gujrat', '380024');

INSERT INTO CUSTOMER (Cust_ID, Branch_Code, Cust_FirstName, Cust_LastName, Cust_username, Cust_DOB, Cust_email,
	Cust_passwd, Cust_Gender, Cust_Address1, Cust_City, Cust_State, Cust_PINCODE,PasswdLastUpdatedDate) VALUES
    ('1', 'A1B2', 'Gaurav', 'Joshi', 'go_josh', '1995-01-01', 'gj@gmail.com', 'mai_hu_morgan', 'M', 'abcd chowk,gujrat', 'ahemedabad', 'gujrat', '380024',CURRENT_DATE - 100),
    ('2', 'C1D2', 'Pavan', 'Bharadiya', 'pro_gymmer', '1995-06-09', 'pkb@gmail.com', 'netapp_6', 'M', 'raj nagar,gujrat', 'gandhi nagar', 'gujrat', '380012',CURRENT_DATE - 90),
    ('3', 'E1F2', 'Rajeev', 'Shukla', 'shukla_ji', '1993-04-11', 'rps@gmail.com', 'carrom_ka_baap', 'M', 'any nagar,raipur', 'raipur', 'Chhattisgarh', '490042',CURRENT_DATE - 45),
    ('4', 'E1F2', 'Saurabh', 'Mehta', 'samsaurabh', '1993-09-27', 'sm@gmail.com', 'sports_lover', 'M', 'abcd apartment,delhi', 'New Delhi', 'Delhi', '110092',CURRENT_DATE);

INSERT INTO account (Acc_No, Branch_Code, Cust_ID, Acc_Type, Acc_Balance, LastTransactionTime, LastQrtrFeeDeductDate, Transaction_count, credit_score) VALUES
    ('1', 'A1B2', '1', 'Student_Savings', '10000', TRANSACTION_TIMESTAMP() - interval '10 day', CURRENT_DATE - 91, '1', '250'),
    ('2', 'C1D2', '2', 'Govt_Savings', '20000', TRANSACTION_TIMESTAMP() - interval '7 day', CURRENT_DATE - 91, '12', '250'),
    ('3', 'E1F2', '3', 'Govt_Savings', '30000', TRANSACTION_TIMESTAMP() - interval '5 day', CURRENT_DATE - 91, '23', '250'),
    ('4', 'A1B2', '4', 'Normal_Savings', '40000', TRANSACTION_TIMESTAMP() - interval '3 day', CURRENT_DATE - 90, '34', '250'),
    ('5', 'C1D2', '1', 'Normal_Savings', '21000', TRANSACTION_TIMESTAMP() - interval '1 day', CURRENT_DATE - 90, '45', '250');

INSERT INTO transaction (Tx_ID, Branch_Code, Acc_No, Cust_ID, Tx_type, Tx_time, Tx_desc, Acc_Balance, Tx_amount) VALUES
    ('1', 'A1B2', '1', '1', 'credit', TRANSACTION_TIMESTAMP() - interval '10 day', 'add money', '10000','1500'),
    ('2', 'A1B2', '2', '2', 'debit', TRANSACTION_TIMESTAMP() - interval '7 day', 'subtract money','20000', '1000'),
    ('3', 'A1B2', '3', '3', 'debit', TRANSACTION_TIMESTAMP() - interval '5 day', 'add money', '30000', '1000'),
    ('4', 'A1B2', '4', '4', 'debit', TRANSACTION_TIMESTAMP() - interval '3 day', 'subtract money', '40000', '1000'),
    ('5', 'C1D2', '5', '1', 'credit', TRANSACTION_TIMESTAMP() - interval '1 day', 'add money', '21000','500'),
    ('6', 'C1D2', '5', '1', 'credit', TRANSACTION_TIMESTAMP() - interval '1 day', 'add money', '21000','500');

-- UPDATE RULES

-- select * from customer where date(PasswdLastUpdatedDate) < CURRENT_DATE - 90;
-- update customer set Cust_passwd ='DEFAULT' where Cust_ID=?

-- select * from account where Transaction_count >= '10';
-- update account set credit_score = CAST (credit_score AS INTEGER) + CAST (Transaction_count AS INTEGER)/10, Transaction_count =  CAST (Transaction_count AS INTEGER) - 10*(CAST (Transaction_count AS INTEGER)/10) where Acc_no=?;

-- select * from account where date(LastQrtrFeeDeductDate) < CURRENT_DATE - 90;
-- update account set LastQrtrFeeDeductDate = CURRENT_DATE, acc_balance = CAST (acc_balance AS INTEGER) - CAST (acc_balance AS INTEGER)/200 where Acc_no=?;


