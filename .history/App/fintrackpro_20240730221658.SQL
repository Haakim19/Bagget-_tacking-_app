CREATE DATABASE fintrackpro;
USE fintrackpro;
CREATE TABLE Users (
    User_id CHAR(6) NOT NULL,
    User_name VARCHAR (50) NOT NULL UNIQUE,
    First_name VARCHAR(100) NOT NULL,
    Last_name VARCHAR(100) NOT NULL,
    DOB DATE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    pwd VARCHAR(255) NOT NULL,
    Phone_number VARCHAR(15) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    PRIMARY KEY (User_id)
);

CREATE TABLE Expense (
    User_id CHAR(6) NOT NULL, 
    Expense_id INT(10) NOT NULL AUTO_INCREMENT,
    Expense_name VARCHAR(50) NOT NULL,
    Amount DECIMAL(8,2),
    Description TEXT,
    date_ DATE,
    time_ TIME,
    PRIMARY KEY(Expense_id),
    FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

CREATE TABLE Income (
    User_id CHAR(6) NOT NULL, 
    Income_id INT(10) NOT NULL AUTO_INCREMENT,
    Amount DECIMAL(8,2),
    Description TEXT,
    date_ DATE,
    time_ TIME,
    PRIMARY KEY(Income_id),
    FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

CREATE TABLE Goal (
    User_id CHAR(6) NOT NULL, 
    Goal_id INT(10) NOT NULL AUTO_INCREMENT,
    Goal_name VARCHAR(100) NOT NULL,
    Description TEXT,
    Start_date DATE,
    End_date DATE,
    PRIMARY KEY(Goal_id),
    FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

CREATE TABLE Account (
    User_id CHAR(6) NOT NULL, 
    Account_id INT(10) NOT NULL AUTO_INCREMENT,
    Account_number BIGINT(16) NOT NULL UNIQUE,
    Account_type VARCHAR(30) NOT NULL,
    Holder_name VARCHAR(100) NOT NULL,
    branch_name VARCHAR(100) NOT NULL,
    PRIMARY KEY(Account_id),
    FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

CREATE TABLE Bank (
    Account_id INT(10) NOT NULL,
    Bank_id INT(10) NOT NULL AUTO_INCREMENT,
    Bank_name VARCHAR(100) NOT NULL,
    Bank_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (Bank_id),
    FOREIGN KEY (Account_id) REFERENCES Account(Account_id)
);

CREATE TABLE Bank_card (
    User_id CHAR(6) NOT NULL,
    Bank_id INT(10) NOT NULL,
    Bank_card_id INT(10) NOT NULL AUTO_INCREMENT,
    Bank_card_number BIGINT(16) NOT NULL UNIQUE,
    Emv_number INT(3) NOT NULL,
    Exp_date DATE,
    PRIMARY KEY(Bank_card_id),
    FOREIGN KEY (User_id) REFERENCES Users(User_id),
    FOREIGN KEY (Bank_id) REFERENCES Bank(Bank_id)
);

CREATE TABLE Transactions (
    Account_id INT(10) NOT NULL,
    Transaction_id INT(10) NOT NULL AUTO_INCREMENT,
    User_Account_number BIGINT(16) NOT NULL,
    Transaction_name VARCHAR(50) NOT NULL,
    Amount DECIMAL(8,2) NOT NULL,
    Description TEXT,
    Transaction_method VARCHAR(20) NOT NULL,
    PRIMARY KEY (Transaction_id),
    FOREIGN KEY (Account_id) REFERENCES Account(Account_id)
);

CREATE TABLE Recipient (
    Transaction_id INT(10) NOT NULL,
    Recipient_id INT(10) NOT NULL AUTO_INCREMENT,
    Recipient_name VARCHAR(100) NOT NULL,
    Recipient_account_number BIGINT(16) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone_number VARCHAR(15),
    Recipient_type VARCHAR(20) NOT NULL,
    PRIMARY KEY (Recipient_id),
    FOREIGN KEY (Transaction_id) REFERENCES Transactions(Transaction_id)
);

CREATE TABLE Transfer (
    Recipient_id INT(10) NOT NULL,
    Transaction_id INT(10) NOT NULL,
    Account_id INT(10) NOT NULL,
    Date_ DATE NOT NULL,
    FOREIGN KEY (Recipient_id) REFERENCES Recipient(Recipient_id),
    FOREIGN KEY (Transaction_id) REFERENCES Transactions(Transaction_id),
    FOREIGN KEY (Account_id) REFERENCES Account(Account_id)
);