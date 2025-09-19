📊 Loan Approval Analysis and Risk Assessment

This project analyzes a bank loan dataset to provide insights into loan approval patterns, credit risk, and financial behavior. It uses SQL (MySQL) for data cleaning and Python (Pandas, Seaborn, Matplotlib) for exploratory data analysis (EDA) and visualization.

## 🚀 Workflow

1. **Data Cleaning (MySQL)**

   * Converted `ApplicationDate` to date format.
   * Removed duplicates, invalid ages, and negative values.
   * Standardized `EmploymentStatus`.

2. **EDA (Python in Colab)**

   * Summary statistics & missing value checks.
   * Checked unique values in categorical columns. 
   * Correlation analysis.

3. **Visualizations**

   Sure! Instead of “KDE plot,” you can use a more formal term like **“density distribution plot.”**

Here’s the updated section:

---

### 3️⃣ Visualizations

* **Loan Approval:** Pie chart of approved vs declined loans.
* **Credit Score:** Density distribution plot showing spread of credit scores.
* **Income vs Approval:** Box plot by loan status.
* **Loan vs Interest:** Scatter plot of amount and rate.
* **Debt vs Income:** Scatter plot by approval.
* **Loan Approval Rate by Employment & Risk Score:** Pivot table heatmap showing average risk scores.
* **Feature Correlation:** Heatmap of numerical variables.

---



## 📂 Dataset Columns

* `ApplicationDate`, `Age`, `EmploymentStatus`, `AnnualIncome`, `CreditScore`
* `LoanAmount`, `MonthlyIncome`, `MonthlyDebtPayments`, `TotalDebtToIncomeRatio`
* `LoanApproved`, `InterestRate`, `MonthlyLoanPayment`, `RiskScore`

---

## ⚙️ Tools

* **SQL:** MySQL Workbench
* **Python:** Pandas, Matplotlib, Seaborn

---

## ✅ Key Insights

* Higher credit scores → higher approval chances.
* Lower debt-to-income ratio → safer applicants.
* Employment status affects approval & risk.

---

