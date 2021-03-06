# features/student_view.feature
Feature: Student View
  As a student
  I want to login to my account
  So I can submit/withdraw force request and update my profile

Background: students have been added to database 

Given the following students exist:
  | name       | firstname  |  lastname    | uin        | password   | email                | major               |classification | Minor           
  | junqi yang | junqi      |   yang       | 221004901  | 151718     | junqiyang@tamu.edu   | Computer Science    |G              | Animal Science
  | Adam will  | Adam       |   will       | 000000000  | 151718     | Will@tamu.edu        | Computer Science    |G              | Animal Science


  
Scenario: View profile
When I am on the Login Page
When I login with correct login info
Then I should be on Student Dashboard Page
When I click my profile
Then I should see my personal information
And I click OK
Then I should go back to dashboard

Scenario: Update profile
When I am on the Login Page
When I login with correct login info
Then I should be on Student Dashboard Page
When I click my profile
Then I should see my personal information
And I click Update
Then I should be on root page
And I should see update success

Scenario: Update profile
When I am on the Login Page
When I login with correct login info
Then I should be on Student Dashboard Page
When I click my profile
Then I should see my personal information
When I fill out the UIN worng
And I click Update
Then I should see error message for same UIN
When I fill out the email worng
And I click Update
Then I should see error message for same email

Scenario: Add/withdraw new requests
When I am on the Login Page
When I login with correct login info
Then I should be on Student Dashboard Page
When I click on New Force Request
And I complete the form 
And I click Save Request
Then I should see a confirm message
Then I should be on Student Dashboard Page
When I click on Delete
Then I should not see that request on Student Dashboard Page

Scenario: Student change password with right information
When I am on the Login Page
When I login with correct login info
Then I should be on Student Dashboard Page
When I click change password button
Then I should be on change password page
When I fill the form and confirm
Then I should read a successful message

Scenario: Student change password with wrong information
When I am on the Login Page
When I login with correct login info
Then I should be on Student Dashboard Page
And I click change password button
Then I should be on change password page
When I fill the old password wrongly
Then I stay on the page on recieve warining
When I fill the new password wrongly
Then I stay on the page on recieve another warining
When I withdraw this request
Then I will back to student dashboard

Scenario: Student Logout
When I am on the Login Page
When I login with correct login info
And I click logout button
Then I should be on root page

Scenario: Student Forget Password
When I am on the Login Page
And I click forget password
Then I should be on reset password page
When I input my Email and click reset
Then I should see a message