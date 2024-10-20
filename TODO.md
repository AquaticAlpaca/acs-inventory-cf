Problem:

The API Gateway URL changes every time the stack is deployed. The website index.html has a hard-coded link to that URL, and must be modified. To fix:
 - Get a permanent URL, or
 - Make the link in index.html dynamic


Problem:
The database has no data
 - DONE: Define a lambda to insert data
 - Save the lambda and its API Gateway as SAM code
 - Define a website form to accepet the data and execute the lambda

Problem:
The application needs to support substring queries, partial matches, and wildcard queriees, but DynamoDB doesn't support it
 - Use Amazon OpenSearch to index the database, then run search queries against OpenSearch
