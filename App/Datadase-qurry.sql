SELECT * FROM transactions WHERE account_id IN (SELECT account_id FROM account WHERE user_id IN(SELECT user_id FROM users WHERE user_id = 'U00001'));

SELECT 
    Users.First_name,
    Expense.Expense_name, 
    Expense.Amount AS Expense_Amount, 
    Expense.Description AS Expense_Description, 
    Expense.date_ AS Expense_Date,  
    Income.Amount AS Income_Amount, 
    Income.Description AS Income_Description, 
    Income.date_ AS Income_Date,  
    Goal.Goal_name,
    Goal.Description AS Goal_Description,
    Goal.Start_date,
    Goal.End_date,
    Account.Account_number,
    Account.Account_type,
    Account.Holder_name,
    Account.branch_name,  
    Bank.Bank_name,    
    Bank_card.Bank_card_number,
    Bank_card.Emv_number,
    Bank_card.Exp_date AS Bank_card_Exp_date,   
    Transactions.Transaction_name,
    Transactions.Amount AS Transaction_Amount,
    Transactions.Description AS Transaction_Description,
    Transactions.Transaction_method,  
    Recipient.Recipient_name,
    Recipient.Recipient_account_number,
    Recipient.Recipient_type,
    Transfer.Date_ AS Transfer_Date
FROM 
    Users
INNER JOIN 
    Expense ON Users.User_id = Expense.User_id
INNER JOIN 
    Income ON Users.User_id = Income.User_id
INNER JOIN 
    Goal ON Users.User_id = Goal.User_id
INNER JOIN 
    Account ON Users.User_id = Account.User_id
INNER JOIN 
    Bank ON Account.Account_id = Bank.Account_id
INNER JOIN 
    Bank_card ON Users.User_id = Bank_card.User_id AND Bank.Bank_id = Bank_card.Bank_id
INNER JOIN 
    Transactions ON Account.Account_id = Transactions.Account_id
INNER JOIN 
    Recipient ON Transactions.Transaction_id = Recipient.Transaction_id
INNER JOIN 
     Transfer ON Recipient.Recipient_id = Transfer.Recipient_id AND Transactions.Transaction_id = Transfer.Transaction_id AND Account.Account_id = Transfer.Account_id;


SELECT  
    Transactions.Transaction_name, 
    Transactions.Amount AS Transaction_Amount, 
    Transactions.Description AS Transaction_Description, 
    Transactions.Transaction_method,
    Transactions.Account_id,
    
    Recipient.Recipient_name,
    Recipient.Recipient_account_number,
    Recipient.Email AS Recipient_Email,
    Recipient.Phone_number AS Recipient_Phone_number,
    Recipient.Recipient_type,
    Account.Account_id,
    Account.Account_number,
    Account.Account_type,
    Account.Holder_name,
    Account.branch_name,
    Transfer.Date_ AS Transfer_Date
FROM 
    Transactions
JOIN 
    Recipient ON Transactions.Transaction_id = Recipient.Transaction_id
JOIN 
    Transfer ON Recipient.Recipient_id = Transfer.Recipient_id 
            AND Transactions.Transaction_id = Transfer.Transaction_id
JOIN 
    Account ON Transactions.Account_id = Account.Account_id
            AND Transfer.Account_id = Account.Account_id;