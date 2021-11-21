create database rxTW;
use rxTW;

-- Phong
create TABLE EMPLOYEE(
	Ssn 	int unsigned	not null 	auto_increment,
	FName 	VARCHAR(50)	not null,
	Email 	VARCHAR(50)	DEFAULT NULL,
	Sex 	char			DEFAULT NULL,
	DoB 	DATE			DEFAULT NULL,
	Address VARCHAR(200) 	DEFAULT NULL,
    Salary 	int 			DEFAULT NULL,
    Bank_Id varchar(16)		DEFAULT NULL,
    Bank_Name 	VARCHAR(50) 	DEFAULT NULL,
    Bank_Branch VARCHAR(50)	DEFAULT NULL,
    Degree 		VARCHAR(50)	DEFAULT NULL,
    Mssn 		int unsigned,
    IdBranch	int	unsigned	DEFAULT NULL,
    Username 	VARCHAR(50)	DEFAULT NULL,
    primary key (Ssn)
    
);

create table PhoneNumber(
	Tssn 		int unsigned	not null,
    Phone_num 	VARCHAR(10)	NOT NULL,
    primary key (Tssn, Phone_num)
);

create table Dependent(
	Essn	int	unsigned		not null,
    FDName	VARCHAR(50)	not null,
    Relationship	VARCHAR(50)	DEFAULT NULL,
    Dob				date 			DEFAULT NULL,
    primary key	(Essn, FDName)
);
 
-- Uy

CREATE TABLE rxtw.branch (
  ID 	INT UNSIGNED 	NOT NULL 	AUTO_INCREMENT,
  BName	VARCHAR(255) 	NOT NULL,
  Address	VARCHAR(255)	NULL,
  Phone_num VARCHAR(255) 	NULL,
  PRIMARY KEY (ID),
  UNIQUE INDEX ID_UNIQUE (ID ASC) VISIBLE);

CREATE TABLE rxtw.user (
    Username	VARCHAR(255)	NOT NULL,
    Pass	 	VARCHAR(255)	NOT NULL, 		-- password	-> pass
    IsAdmin TINYINT NULL,
    PRIMARY KEY (Username),
    UNIQUE INDEX Username_UNIQUE (Username ASC) VISIBLE);
    
CREATE TABLE customer (
  ID	int unsigned	NOT NULL	AUTO_INCREMENT,
  CName varchar(255)	DEFAULT NULL,
  Phone_num varchar(10) DEFAULT NULL,
  Sex 		char(1) 	DEFAULT NULL,
  UserName varchar(255) DEFAULT NULL,
  PRIMARY KEY 	(ID),
  UNIQUE KEY 	ID_UNIQUE (ID)
);
    
 -- Luan
CREATE TABLE Import_order
(
	ID 	int unsigned	auto_increment	NOT NULL,
    IDate 			date 			DEFAULT NULL,
    Name_partner	varchar(30) 	NOT NULL,
    Phone_partner	CHAR(10) 		DEFAULT NULL,
    ID_branch 		int unsigned 	DEFAULT NULL,
    PRIMARY KEY (ID)
);

create table Have
(
	ID_item		int unsigned	NOT NULL, -- auto_increment,
    ID_branch	int unsigned	NOT NULL, -- auto_increment,
    Quantity 	int unsigned	DEFAULT NULL,
    primary key (ID_item, ID_branch)
);

create table Include
(
	ID_item			int unsigned	NOT NULL, -- auto_increment,
    ID_import		int unsigned	NOT NULL, -- auto_increment,
    Quantity_Item	int unsigned	DEFAULT NULL,
	Price_Of_Item	int unsigned	DEFAULT NULL,
    primary key (ID_item, ID_import)
);

-- Lwu
CREATE TABLE Cart(
    ID			int	unsigned 	NOT NULL	auto_increment,
    ID_customer int unsigned 	NOT NULL,
    Clerk_SSN 	int unsigned	NOT NULL,
    Create_time	date			default null,
    voucher_ID	int	unsigned 	DEFAULT NULL,
    State 		CHAR 			default null,
    primary key(ID)
);
CREATE TABLE Cart_detail(
    ID_item		int unsigned 	NOT NULL,
    ID_Cart 	int unsigned 	NOT NULL,
    Price 		int unsigned	default null,
    quantity	int unsigned	default null,
    primary key(ID_item,ID_Cart)
);
CREATE TABLE Food(
    ID_item			int unsigned	NOT NULL,
    Net_weight 		int unsigned 	default null,
    Expired_date	date default 	null,
    Fat_content 	int unsigned 	default null,
    primary key(ID_item)
);

-- Khoa
CREATE TABLE ITEM
(
    ID 				int unsigned 	NOT NULL	auto_increment,
    Name_ 			VARCHAR(50) 	NOT NULL,
    Desciption		VARCHAR(50) 	DEFAULT NULL,		-- fix
    Listed_price 	INT UNSIGNED	DEFAULT NULL,
	Import_price 	INT unsigned	DEFAULT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE VOUCHER
(
    ID int unsigned NOT NULL auto_increment,
    Applied_price Int		DEFAULT NULL,
    Max_discount Int		DEFAULT NULL,
    Discount_percent Int	DEFAULT NULL,
	Start_date DATE			DEFAULT NULL,
    End_date DATE			DEFAULT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE DRINK
(
    ID_item int unsigned NOT NULL ,
    Ice_quantity int	DEFAULT NULL,
    Sweetness int		DEFAULT NULL,
    Size INT UNSIGNED	DEFAULT NULL,
    PRIMARY KEY (ID_item)
);

####################################################################		alter to add FK
ALTER TABLE PhoneNumber ADD CONSTRAINT fk_PhoneNum FOREIGN KEY (Tssn) REFERENCES Employee(SSN);

ALTER TABLE dependent ADD CONSTRAINT fk_Dependent_Essn FOREIGN KEY (Essn) REFERENCES Employee(SSN);

ALTER TABLE Employee ADD CONSTRAINT fk_Employee_Mssn FOREIGN KEY (Mssn) REFERENCES Employee(SSN);

ALTER TABLE Employee ADD CONSTRAINT fk_Employee_idB FOREIGN KEY (IdBranch) REFERENCES Branch(ID);

ALTER TABLE Employee ADD CONSTRAINT fk_Employee_User FOREIGN KEY (Username) REFERENCES rxtw.User(Username);

ALTER TABLE Customer ADD CONSTRAINT fk_Customer_User FOREIGN KEY (Username) REFERENCES rxtw.User(Username);

ALTER TABLE Have ADD CONSTRAINT fk_Have_item FOREIGN KEY (ID_item) REFERENCES item(ID);

ALTER TABLE Have ADD CONSTRAINT fk_Have_branch FOREIGN KEY (ID_branch) REFERENCES branch(ID);

ALTER TABLE import_order ADD CONSTRAINT fk_IO_branch FOREIGN KEY (ID_branch) REFERENCES branch(ID);

ALTER TABLE Include ADD CONSTRAINT fk_Include_item FOREIGN KEY (ID_item) REFERENCES item(ID);

ALTER TABLE Include ADD CONSTRAINT fk_Include_import FOREIGN KEY (ID_import) REFERENCES import_order(ID);

ALTER TABLE Cart ADD CONSTRAINT fk_Cart_customer FOREIGN KEY (ID_customer) REFERENCES customer(ID);

ALTER TABLE Cart ADD CONSTRAINT fk_Cart_clerk FOREIGN KEY (Clerk_ssn) REFERENCES Employee(Ssn);

ALTER TABLE Cart ADD CONSTRAINT fk_Cart_voucher FOREIGN KEY (voucher_id) REFERENCES Voucher(ID);

ALTER TABLE Cart_detail ADD CONSTRAINT fk_CartDetail_item FOREIGN KEY (ID_item) REFERENCES item(ID);

ALTER TABLE Cart_detail ADD CONSTRAINT fk_CartDetail_cart FOREIGN KEY (ID_Cart) REFERENCES cart(ID);

ALTER TABLE Food ADD CONSTRAINT fk_food_item FOREIGN KEY (ID_Item) REFERENCES item(ID);

ALTER TABLE Drink ADD CONSTRAINT fk_drink_item FOREIGN KEY (ID_Item) REFERENCES item(ID);