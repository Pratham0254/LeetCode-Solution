USE leetcode;
# 1581. Customer Who Visited but Did Not Make Any Transactions

CREATE TABLE Visits (
    visit_id INT,
    customer_id INT
);

INSERT INTO Visits (visit_id, customer_id) VALUES
(1, 23),
(2, 9),
(4, 30),
(5, 54),
(6, 96),
(7, 54),
(8, 54);

CREATE TABLE Transactions (
    transaction_id INT,
    visit_id INT,
    amount INT
);

INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES
(2, 5, 310),
(3, 5, 300),
(9, 5, 200),
(12, 1, 910),
(13, 2, 970);

SELECT customer_id, count(customer_id) as count_no_trans FROM Visits V
LEFT JOIN Transactions T
ON V.visit_id = T.visit_id
WHERE Transaction_id IS NULL
GROUP BY customer_id
ORDER BY count_no_trans DESC;
