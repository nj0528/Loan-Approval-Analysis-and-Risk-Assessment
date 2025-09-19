select * from loan
# DATA CLEANING
SET SQL_SAFE_UPDATES = 0;

-- Handle missing categorical values
UPDATE loan
SET EmploymentStatus = 'Unknown'
WHERE EmploymentStatus IS NULL OR EmploymentStatus = '';

-- Convert ApplicationDate from string (MM/DD/YYYY) to DATE

-- 1️⃣ Add a temporary DATE column
ALTER TABLE loan ADD COLUMN ApplicationDate_clean DATE;

-- 2️⃣ Convert text to DATE using DD-MM-YYYY
UPDATE loan
SET ApplicationDate_clean = STR_TO_DATE(ApplicationDate, '%d-%m-%Y')
WHERE ApplicationDate IS NOT NULL AND ApplicationDate != '';

-- 3️⃣ Optional: check results
SELECT ApplicationDate, ApplicationDate_clean
FROM loan
LIMIT 10;

-- 4️⃣ Drop old text column
ALTER TABLE loan DROP COLUMN ApplicationDate;

-- 5️⃣ Rename cleaned column
ALTER TABLE loan CHANGE ApplicationDate_clean ApplicationDate DATE;

-- 2️⃣ Remove future or obviously invalid dates
DELETE FROM loan
WHERE ApplicationDate > CURDATE()
   OR ApplicationDate < '1900-01-01';

-- 3️⃣ Handle missing categorical values
UPDATE loan
SET EmploymentStatus = 'Unknown'
WHERE EmploymentStatus IS NULL OR EmploymentStatus = '';

-- 4️⃣ Handle missing numeric values (replace NULL with 0)
UPDATE loan
SET AnnualIncome = COALESCE(AnnualIncome, 0),
    CreditScore = CASE 
                    WHEN CreditScore IS NULL OR CreditScore < 300 OR CreditScore > 850 
                    THEN 0 ELSE CreditScore END,
    LoanAmount = COALESCE(LoanAmount, 0),
    MonthlyIncome = COALESCE(MonthlyIncome, 0),
    MonthlyDebtPayments = COALESCE(MonthlyDebtPayments, 0),
    TotalDebtToIncomeRatio = COALESCE(TotalDebtToIncomeRatio, 0),
    InterestRate = COALESCE(InterestRate, 0),
    MonthlyLoanPayment = COALESCE(MonthlyLoanPayment, 0),
    RiskScore = COALESCE(RiskScore, 0);

-- 5️⃣ Fix invalid ages
UPDATE loan
SET Age = NULL
WHERE Age < 18 OR Age > 100;
SELECT * FROM loan limit 10
