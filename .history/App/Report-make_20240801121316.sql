CREATE VIEW Accounts_Report AS
SELECT 
u.User_name,
a.Account_number,
t.Transaction_name,
t.Amount,
t.Transaction_method,
r.Recipient_name,
r.Recipient_account_number,
tr.Date_
FROM 
    Users u
INNER JOIN
    Account a ON u.user_id = a.User_id
INNER JOIN 
    Transactions t ON a.account_id = t.account_id
INNER JOIN
    Recipient r ON t.Transaction_id = r.Transaction_id 
INNER JOIN 
    Transfer tr ON tr.Transaction_id = t.Transaction_id;

SELECT * FROM Accounts_Report WHERE Amount >= 10000 ;


