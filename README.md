# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 
  Ruby 2.4.0

* Rails version
  Rails 5

* System dependencies
  Ubuntu/linux

* Database
  MYSQL

* Database name
  election

* Tables(columns)
  election(id,title,description,max_votes_per_user)
  users(id,name,email,electoral_id,address1,address2,city,pincode,county)
  candidates(user_id,party_name,election_id)
  user_voting(election_id,user_id,voting_count)
  votes(election_id,candidate_id,vote_count)

* Services
  auth -> authentication related services
  polling -> polling related services

* Deployment instructions
  1. Install the ruby and rails as per the version mentioned
  2. Install mysql and setup the database. Please check database.yml for reference
  3. Run "bundle install" command to install all required gems in the Gemfile
  4. Install httpie tool which is usefull for testing the APIs
  5. Run the rails server "rails -s" from the the root directory
  6. Using httpie REST client test in console

API Design 

The below section explains the important aspects that need to be covered during a API design

1. Authentication and Authorization

 Token-based authentication (also known as JSON Web Token authentication ) is a new way of handling authentication of users in applications. It is an alternative to session-based authentication .

The most notable difference between the session-based and token-based authentication is that former relies heavily on the server. A record is created for each logged-in user.

Token-based authentication is stateless -- it does not store anything on the server but creates a unique encoded token that gets checked every time a request is made.

Unlike session-based authentication, a token approach would not associate a user with login information but with a unique token that is used to carry client-host transactions. Many applications, including Facebook, Google, and GitHub, use the token-based approach.
Benefits of token-based authentication

There are several benefits to using such approach:

    Cross-domain / CORS
        Cookies and CORS don't mix well across different domains. A token-based approach allows you to make AJAX calls to any server, on any domain because you use an HTTP header to transmit the user information.

    Stateless
        Tokens are stateless. There is no need to keep a session store, since the token is a self-contained entity that stores all the user information in it.

    Decoupling
        You are no longer tied to a particular authentication scheme. Tokens may be generated anywhere, so the API can be called from anywhere with a single authenticated command rather than multiple authenticated calls.

    Mobile ready
        Cookies are a problem when it comes to storing user information on native mobile applications. Adopting a token-based approach simplifies this saving process significantly.

    CSRF (Cross Site Request Forgery)
        Because the application does not rely on cookies for authentication, it is invulnerable cross site request attacks.

    Performance
        In terms of server-side load, a network roundtrip (e.g. finding a session on database) is likely to take more time than calculating an HMACSHA256 code to validate a token and parsing its contents, making token-based authentication faster than the traditional alternative.

How does it work?

The way token-based authentication works is simple: The user enters his/her credentials and sends a request to the server. If the credentials are correct, the server creates a unique HMACSHA256 encoded token also known as JSON web token (JWT). The client stores the JWT and makes all subsequent requests to the server with the token attached. The server authenticates the user by comparing the JWT sent with the request to the one it has stored in the database. 
There is a diagram along with this app, which helps us to understand the flow


What does a JWT token contain?

The token is separated in three base-64 encoded, dot-separated values, each one representing a different type of data:
Header

Consits of the type of the token (JWT) and the type of encryption algorithm (HS256) encoded in base-64.
Payload

The payload contains information about the user and his/her role. For example, the payload of the token can contain the e-mail and the password.
Signature

Signature is a unique key that identifies the service which creates the header. In this case, the signature of the token will be a base-64 encoded version of the Rails application's secret key (Rails.application.secrets.secret_key_base). Because each application has a unique base key, this secret key serves as the token signature.


2. Use HTTP Methods and status codes

Use the HTTP method names to mean something:

    POST - create and other non-idempotent operations.
    PUT - update.
    GET - read a resource or collection.
    DELETE - remove a resource or collection.

Use HTTP status codes to be meaningful.

    200 - Success.
    201 - Created. Returned on successful creation of a new resource. Include a 'Location' header with a link to the newly-created resource.
    400 - Bad request. Data issues such as invalid JSON, etc.
    404 - Not found. Resource not found on GET.
    409 - Conflict. Duplicate data or invalid data state would occur

3. Use JSON responses

4. Use versioning 

 In this app I havent covered. But this is very much important for a API that are used in cross functional platform. Example if the API's are used in various mobile platforms like iOS,android,windows, etc we need to do the proper versioning to make sure that the correct version of API is integrated with the correct build version

5. Use Pagination

  Usually in large scale application there is huge amount of data to be retrieved and transmitted which is tedious to handle if we dont have the pagination. 


*APIs

  post 'auth/login'
   logs in the user with email and password that was already registered. In response it send a auth token which is used to validate all other requests

  post 'signup'
   signs up the user to the application. email and electoral id are unique to the application. In response it sends a auth token which is used to validate all other requests

  post 'election'
   helps to create a new election. Usually it should be used by the admin. Here the admin scope is not covered for now
  
  post 'candidate'
   helps to create a new candidate for a election. Usually it should be used by the admin. Here the admin scope is not covered for now
  
  post 'voting'
   User can vote with the candidate preference 

  get  'result/:election_id'
    result of the election is published based on the election id. This scope also goes to admin user


* Examples using httpie client library for testing
  
  
  #signup
  http :3000/signup name=ash email=ash@email.com password=foobar password_confirmation=foobar electoral_id=23fe3r3r 

  #login
  http :3000/auth/login email=new2@email.com password=bar


  #creation of election
  http :3000/election title=test1 max_votes_per_user=3 \Authorization:'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0OTczMDY4NjJ9.iuig9P-z5s88E9e6wFE2_XoChazAolSaKxBUR2qQj_c'
  
  #creation of candidates
  http :3000/candidate user_id=1 election_id=1 party_name=C \Authorization:'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0OTczMDY4NjJ9.iuig9P-z5s88E9e6wFE2_XoChazAolSaKxBUR2qQj_c'


  #voting
  http :3000/voting election_id=1 electoral_id=23dfaa candidate_id=1\Authorization:'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE0OTczMTIzNzF9.bJ1IlubewnpjKuUz_djYSwvsJsmpZXWY3tLS9DvRtJ0'

  #results
  http :3000/result/1 \Authorization:'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE0OTczMTIzNzF9.bJ1IlubewnpjKuUz_djYSwvsJsmpZXWY3tLS9DvRtJ0'
  

