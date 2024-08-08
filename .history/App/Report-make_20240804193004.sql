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


DELIMITER &&

CREATE PROCEDURE Transfer_data(IN p_UserName VARCHAR(50))
BEGIN
    SELECT 
        u.User_name,
        a.account_number,
        b.Bank_name,
        bc.Bank_card_number
    FROM
        Users u
    INNER JOIN
        Account a ON u.User_id = a.User_id
    INNER JOIN
        Bank b ON a.Account_id = b.Account_id
    INNER JOIN
        Bank_card bc ON u.User_id = bc.User_id
    WHERE
        u.User_name = p_UserName;
END &&

DELIMITER ;
call Transfer_data ();


CREATE VIEW Account_details AS

SELECT 
    a.Account_number,
    a.Account_type,
    a.Holder_name,
    a.branch_name,
    b.Bank_name,
    Bank_type
FROM 
    account a
INNER JOIN
    Bank b ON b.Account_id = a. Account_id;
SELECT * FROM Account_details;
