USE fintrackpro;
SELECT * FROM users;
SELECT * FROM account;
SELECT * FROM transactions;
SELECT * FROM transfer;
SELECT * FROM income;
SELECT * FROM expense;
SELECT * FROM recipient;
SELECT * FROM bank;
SELECT * FROM bank_card;
SELECT * FROM goal;

#creating a trigger to auto incriment the data annd time in income table
DELIMITER $$

CREATE TRIGGER set_date_time_before_insert
BEFORE INSERT ON Income
FOR EACH ROW
BEGIN
    SET NEW.date_ = CURRENT_DATE;
    SET NEW.time_ = CURRENT_TIME;
END $$

DELIMITER ;

#creating a trigger to auto incriment the data annd time in expence table
DELIMITER $$

CREATE TRIGGER set_date_time_before_insert_to_expence
BEFORE INSERT ON expense
FOR EACH ROW
BEGIN
    SET NEW.date_ = CURRENT_DATE;
    SET NEW.time_ = CURRENT_TIME;
END $$

DELIMITER ;
-- Users Table Data
INSERT INTO users VALUE 
('U00001' ,'haakimaj', 'haakim', 'ahamed', '02/13/2003', 'haakim@gmail.com' , 'haakimaj', '0757956078', '150/watadeniya,kandy'),
('U00002' ,'zoro012', 'Roronoa', 'Zoro', '11/11/1999', 'zoro@example.com' , 'zoro123', '1234567890', 'colombo-01'),
('U00003' , 'abdula124', 'Abdula', 'Zulkifl', '01/25/2000', 'abdula@example.com' , 'zulkifl123', '2345678910', 'kandy road,nawalapitiya');


-- Expense Table Data
INSERT INTO Expense (User_id, Expense_name, Amount, Description)
VALUES 
('U00001', 'Groceries', 25000.00, 'Weekly grocery shopping'),
('U00001', 'Electricity Bill', 5000.00, 'Monthly electricity bill payment'),
('U00001', 'Internet Bill', 5000.00, 'Monthly internet subscription'),
('U00002', 'Dining Out', 3000.00, 'Dinner at a restaurant'),
('U00002', 'Fuel', 5000.00, 'Fuel for the car'),
('U00002', 'Gym Membership', 2500.00, 'Monthly gym membership fee'),
('U00003', 'Books', 2000.00, 'Purchased books'),
('U00003', 'Rent', 10000.00, 'Monthly rent payment'),
('U00003', 'Utilities', 4500.00, 'Monthly utilities payment');

-- Income Table Data
INSERT INTO Income (User_id, Amount, Description)
VALUES 
('U00001', 150000.00, 'Salary for July'),
('U00001', 20000.00, 'Freelance Project'),
('U00001', 10000.00, 'Stock Dividends'),
('U00002', 200000.00, 'Salary for July'),
('U00002', 10000.00, 'Bonus'),
('U00002', 15000.00, 'Interest from savings'),
('U00003', 180000.00, 'Salary for July'),
('U00003', 25000.00, 'Part-time Job'),
('U00003', 12000.00, 'Investment Returns');

-- Goal Table Data
INSERT INTO Goal (User_id, Goal_name, Description, Start_date, End_date)
VALUES 
('U00001', 'Vacation Fund', 'Saving for a vacation', '2024-01-01', '2024-12-31'),
('U00001', 'Emergency Fund', 'Building an emergency fund', '2024-01-01', '2024-12-31'),
('U00001', 'New Laptop', 'Saving to buy a new laptop', '2024-01-01', '2024-09-30'),
('U00002', 'Buy a Car', 'Saving for a new car', '2024-01-01', '2024-12-31'),
('U00002', 'Home Renovation', 'Saving for home renovation', '2024-01-01', '2024-12-31'),
('U00002', 'Health Fund', 'Building a health fund', '2024-01-01', '2024-06-30'),
('U00003', 'Education Fund', 'Saving for further education', '2024-01-01', '2024-12-31'),
('U00003', 'Wedding Fund', 'Saving for wedding expenses', '2024-01-01', '2024-12-31'),
('U00003', 'Travel Fund', 'Saving for a world trip', '2024-01-01', '2024-12-31');

-- Account Table Data
INSERT INTO Account (User_id, Account_number, Account_type, Holder_name, branch_name)
VALUES 
('U00001', 1234567890123456, 'Savings', 'Haakim Ahamed', 'Kandy Main Branch'),
('U00001', 2345678901234567, 'Current', 'Haakim Ahamed', 'Colombo Branch'),
('U00002', 4567890123456789, 'Savings', 'Roronoa Zoro', 'Colombo Main Branch'),
('U00002', 5678901234567890, 'Current', 'Roronoa Zoro', 'Galle Branch'),
('U00003', 7890123456789012, 'Savings', 'Abdula Zulkifl', 'Nawalapitiya Branch'),
('U00003', 8901234567890123, 'Current', 'Abdula Zulkifl', 'Matara Branch');

-- Bank Table Data
INSERT INTO Bank (Account_id, Bank_name, Bank_type)
VALUES 
(1, 'Bank of Ceylon', 'Public Sector Bank'),
(2, 'Commercial Bank', 'Private Sector Bank'),
(3, 'People\'s Bank', 'Public Sector Bank'),
(4, 'Sampath Bank', 'Private Sector Bank'),
(5, 'Hatton National Bank', 'Private Sector Bank'),
(6, 'DFCC Bank', 'Private Sector Bank');
-- Bank_card Table Data
INSERT INTO Bank_card (User_id, Bank_id, Bank_card_number, Emv_number, Exp_date)
VALUES 
('U00001', 1, 1234567812345678, 123, '2026-07-31'),
('U00001', 2, 2345678923456789, 234, '2025-12-31'),
('U00002', 3, 4567890145678901, 456, '2025-08-31'),
('U00002', 4, 5678901256789012, 567, '2026-09-30'),
('U00003', 5, 7890123478901234, 789, '2025-11-30'),
('U00003', 6, 8901234589012345, 890, '2026-05-31');

-- Transactions Table Data
INSERT INTO Transactions (Account_id, Transaction_name, Amount, Description, Transaction_method)
VALUES 
(1,  'Grocery Shopping', 25000.00, 'Purchased groceries at supermarket', 'Card Payment'),
(1,  'Utility Payment', 5000.00, 'Paid electricity bill', 'Online Transfer'),
(1,  'Internet Subscription', 5000.00, 'Paid monthly internet bill', 'Card Payment'),
(3,  'Restaurant Bill', 3000.00, 'Paid for dinner at restaurant', 'Card Payment'),
(3,  'Fuel Payment', 5000.00, 'Paid for car fuel', 'Online Transfer'),
(3,  'Gym Fee', 2500.00, 'Paid for monthly gym membership', 'Card Payment'),
(5,  'Book Purchase', 2000.00, 'Purchased books', 'Cash Payment'),
(6,  'Rent Payment', 10000.00, 'Paid monthly rent', 'Online Transfer'),
(6,  'Utility Payment', 4500.00, 'Paid monthly utilities', 'Card Payment');

-- Recipient Table Data
INSERT INTO Recipient (Transaction_id, Recipient_name, Recipient_account_number, Email, Phone_number, Recipient_type)
VALUES 
(1, 'Supermarket', 123456789012, 'supermarket@example.com', '0211234567', 'Business'),
(2, 'Electricity Board', 234567890123, 'electricity@example.com', '0212345678', 'Business'),
(3, 'ISP', 345678901234, 'isp@example.com', '0213456789', 'Business'),
(4, 'Restaurant', 456789012345, 'restaurant@example.com', '0211234567', 'Business'),
(5, 'Fuel Station', 567890123456, 'fuelstation@example.com', '0212345678', 'Business'),
(6, 'Gym', 678901234567, 'gym@example.com', '0213456789', 'Business'),
(7, 'Bookstore', 789012345678, 'bookstore@example.com', '0214567890', 'Business'),
(8, 'Landlord', 890123456789, 'landlord@example.com', '0215678901', 'Individual'),
(9, 'Utility Provider', 901234567890, 'utility@example.com', '0216789012', 'Business');

-- Transfer Table Data
INSERT INTO Transfer (Recipient_id, Transaction_id, Account_id, Date_)
VALUES 
(1, 1, 1, '2024-07-01'),
(2, 2, 1, '2024-07-05'),
(3, 3, 1, '2024-07-10'),
(4, 4, 3, '2024-07-02'),
(5, 5, 3, '2024-07-06'),
(6, 6, 3, '2024-07-12'),
(7, 7, 5, '2024-07-03'),
(8, 8, 6, '2024-07-07'),
(9, 9, 6, '2024-07-11');