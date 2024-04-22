## 44643Sec04Team05Spring2024FinalProject
# Legal Case Management System - One stop solution with all Workflows and process design
Its an Enterprise Resource Software to manage the entire lifecycle of Legal cases.

With the escalating number of judicial cases, efficient management of legal proceedings has become a paramount concern for legal professionals and firms. The Legal Case Management System (LCMS) presents a novel solution tailored to address these challenges. LCMS is a mobile application designed to streamline case management processes while ensuring robust levels of authorization and authentication. Targeting legal experts, paralegals, and technical admin teams across diverse law firms, LCMS offers a comprehensive mechanism to track cases from initiation to closure, integrating advanced machine learning algorithms to predict case acceptance probabilities based on client profile scores. Furthermore, LCMS incorporates intuitive data visualization tools to provide insightful representations of case metrics, facilitating informed decision-making and resource optimization. Embracing the principles of efficiency, productivity, and resource optimization, LCMS heralds a new era in legal case management, empowering professionals to navigate the complexities of the legal landscape with ease.

## features of the project 
### Party Information
Display basic and detailed client      information, including case type (defendant or plaintiff), ensuring clarity from the outset.

### CRM Integration
Seamlessly access all client contacts and leads in one centralized platform. Track leads through each stage of the pipeline for enhanced client management.

### Communications and Document Management
Stay organized with integrated communication tools and efficient document management. From emails to case reports, manage every detail effortlessly.

### User Authentication
Ensure security with a robust login page for authorized users. New legal experts can easily sign up for access, streamlining onboarding processes.

### Firebase Integration
Safely host user and client information on Firebase, ensuring data security and accessibility.

### Matter Portfolio
Gain insights into assigned courts and statute of limitations dates to determine case applicability. Easily generate, edit, and securely access documents for ### streamlined case management.

### Reporting and Analytics
Utilize data visualization for comprehensive reporting and analytics. Gain a pictorial representation of matters taken up, total parties created, and drill down into further details such as attorney fees, and new intakes, facilitating informed decision-making and strategic planning.



## Project Work Breakdown Structure(WBS)

1. Feature Discovery
   - Define Project Scope
   - Identify key app features
   - Identify Key stakeholders
2. Prototype Creation
   - Develop a blueprint for app structure and workflow.
   - Brainstorming on key functionalities to be implemented
3. Requirements Gathering
   - Define System requirements
   - Document detailed functional requirements.
   - Develop System Architecture
4. API and Navigation Planning
   - Strategize API integration and design intuitive navigation.
   - Database Design
   - Workflow design
5. Feature Development and Integration
   - Implement a robust database and integrate the frontend using Swift.
   - Kick-off development with an agile approach.
   - Develop User modules (Matter management)
6. Ongoing Assessment
   - Conduct Unit Testing
   - Continuously adapt to evolving app requirements.
7. Deployment 
    - Execute System Development
    - Monitor Performance
8. Documentation
    - Create Technical User Manual
    - Record Standard Operating Procedures
      
  
### Roles and Responsibilities

1. Ajit Ubbanapally – Team Leader, Full Stack developer
   - Responsible for designing the Application workflow
   - Coordinating with the Entire team and Documentation
2. Sunnith Reddy Kondam – Full Stack developer, Business Process Analyst
   - Responsible for Customizing User Interface
   -  Manage the Deployment phase
3. Akshay Kumar Gupta Attuluru – Full Stack developer
   -  Responsible for database design requirements
   -  Documentation
4. Nanne Hussain Shaik – Full Stack Developer
   -  Responsible for Integration Activities
   -  Performing Unit Testing
  
## User Interface Design configuration

Since its an Enterprise resource planning application, the UI is so designed to cater to the Business needs.
The Navigation among different screens is as follows :
- There is an initial login screen where the User(Attorney can provide the login information), with additional feature of forgot User name , Password for easy retrieval.
- After logging in,  the dashboard page would open up -consisting of Parties, Matter, Reports and Profile score.
- When user clicks on parties - the details of all clients would be showcased in list view. There is an option to search for a particular party. When we click on that party - their basic details would be shown up, which includes name, email, billing information etc. There would be another option called advanced - upon clicking on that the detailed case description view of the client would pop up.
- When we click on Matter button - all matters belonging to a particular Case type would be shown.
- When we click on Reports - we get some visualization analysis along with basic reports.
- In profile Score option,  the  Admin can provide ones basic details which will help the software compute the profile score. This would form the basis for whether the case would be accepted or not.

### UI/Prototype
![UI](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/142938211/0ab363bb-7c37-4814-bff0-b2f376275c56)


### Screen1--LOGIN SCREEN


![Screen1](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/143151335/ab831aaa-18e0-4bb4-a926-45a65c588086)
Login Screen
It has Username and Password as text views and Login button along with Remember me checkbox and Forgot Password page.
When clicked on Login button, the username and password have to be authenticated with the firebase userid’s and passwords and login accordingly. The data table for this should contain fields: Name, username, DateOfBirth, Phone Number,User Type, Password, Email, Bar Id(Alphanumeric 10 digit code).
Note:
User doesn’t get to create new users/ signin. This is done only by admin team directly in backend in firebase.

- Buttons pressed:
  -	Login button 
  - Remember me button. 
  - Forgot password. 
  - Sign up. 

- This is a login page where we will sign up using credentials and once it signed in, it will display dashboard where there will be different options to select.


### Screen2 -- DashBoard
![HomeSplitView](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/142938211/18073369-47c5-470d-b653-a0d675ad3d8e)

<img width="253" alt="image" src="https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/142938211/0126142c-220a-42f3-898b-d60e5d5fa098">
From successful login, the user will be directed to a new screen. It is a split view with 5 categories on the left side and Reports/Dashboards to be defaulted on the right screen.

- Its a split view consisting of
  - Parties
  - Matter
  - Report
  - Profile Score
  - Settings
- Each of 5 buttons - Parties, Matter, Report, and Profile Score,Settings will navigate to 4 different screens.

  
### Screen3 -- Settings Page
![Partyview](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/142938211/13c77e7b-f5a6-468e-87f8-8b9cd50febbf)

- It has Name, DOB, Bar Id, Phone Number,User type. These 4 must be fetched from the user database. Along with this, the user must have a logout button. Upon successful logout the page must be navigated to the basic login page.- 

### Screen4 -- Check Profile Score Page
![screen4](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/142938211/0fda3a56-32e3-41c3-8c5c-f04f0b3e86f4)

- This section is accessible within the split view upon selecting "Profile Score" on screen 2. It comprises the following text fields:

•	Party Name
•	Gender
•	Date Of Birth
•	SSN
•	Nationality
•	Case Type
•	No of Convicted Felonies
•	Defendant or Plaintiff
•	Educational level of party
•	Employment status
- The fields when filled should make check profile score button and create as Party button active.
Check Profile Score button should run an ML model in background using CoreML and give a percentage of acceptance as a pop Up alert. We need to click Ok. When clicked on Create Party button, all the data entered should be stored in firebase in party database.

### Screen5 -- Party Overview
![screen5](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/142938211/6c55dfed-301c-44f5-8e32-13a4eb149e2c)
- Party View is a table view in split view with 5 columns Name, Alias, DoB, Phone and Email. It should fetch all the records from the firebase party database. It should have an Search bar above it to search for party based on name. Name should be clickable, and it should redirect to Screen 6.


### Screen 6 -- Party Detail Page
![screen6](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/143151335/1ff139a1-c65f-45c7-8391-682afb37c214)

- It should have an scroll view of all the data of the party fetched from database and it should have 3 buttons at the top. The 3 buttons will be Edit, Delete and Create Matter.
Edit button should make all the above text fields editable and saving the edit should make changes to firebase. Delete should delete the record. Create Matter should redirect to a new page.




### Screen7 --  Create Matter Page
![Screen7](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/143151335/cd9daa26-2331-40a0-93f3-980b9d8eef0f)

- It should have the details from party overview along with the below fields to be fillable.
- Case Title ,Date of Incident, Case Type, Case description, Statute of Limitations date(the deadline for filing a lawsuit.), Matter Value ($), Attorney Fees.,Court Name, Matter Id(Alpha Numeric Id),.
The user should be able to able to click on save matter button which should save this record to firebase matter database. After clicking on save matter button we will be redirected to screen 9




### Screen8 --  Matter Overview
![screen8](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/143151335/936dce05-5e3f-42e8-8de3-cd3ccf473c92)

- Matter View is a table view in split view with 6 columns Matter Id, Case Title, Party Name, Case Type, Matter Value and Date of Incident. It should fetch all the records from the firebase matter database. It should have a Search bar above it to search for matter based on matter id. Case Title should be clickable, and it should redirect to Screen 9.

  ### Screen 9: Matter Detail Page:
This is specific matter page which is similar to party page where the whole particular matter details have to be fetched and it should have 2 buttons edit and delete similar to party Detail page. 


### Screen 10 : Dashboard page 

This should have below  visualizations:
1. No of Matters this Month: Calculate the number of matters created this month from firebase and fill a pie chart based on case types.
2. Intakes this Month:
Calculate the number of parties created and subtract the number of matters and fetch the data in number format here.

## User Interface Design configuration

#### Total Workflow
- Since its an Enterprise resource planning application, the UI is so designed to cater to the Business needs. The Navigation among different screens is as follows :
- There is an initial login screen where the User(Attorney can provide the login information), with additional feature of forgot User name , Password for easy retrieval.
- After logging in, the dashboard page (Screen 2) would open up -consisting of Parties, matter, Reports and Profile score.
- When user clicks on parties - the details of all clients would be showcased in list view (screen 3 ). We can scroll vertically to view all clients/parties.
- There is an option to search for a particular party. When we click on that party - their basic details would be shown up (screen 5), which includes name, email, billing information etc. There would be another option called advanced
- upon clicking on that the detailed case description view of the client would pop up (screen 6). There is an option to scroll screen horizontally and vertically to view all the columns.
- When we click on Matter button on Screen2  - all matters belonging to a particular Case type would be shown (screen 4). We can scroll vertically to view all Matters.
- When we click on Reports in Screen 2 - we get some visualization analysis along with basic reports (screen 7).
- When we click on Profile score button on screen 2, we get redirected to profile score page (screen 8) .the Admin can provide ones basic details which will help the software compute the profile score. This would form the basis for whether the case would be accepted or not.


- The above UI is a prototype. As the project progresses several modifications may be made accordingly to suit to the project requirements

### Basic UI Configurations

- Configured UI of Login page
- Added functionalities, Constriants for views
- configured the dashboard page
- Configured firebase

### User Interface design
- Added additional view controllers
- Created cocoa class for each view controllers
- Implemented navigation feature between each view controllers


### Reset Password Page
- added reset functionality so that user can set their new password
- User can reset his passsword using email ID
- Reset page is part of the UI Navigation View

### Eureka framework
- added some components from Eureka Pachkage into Profile score view page

### configured calender 
- The user can enter ones Date of birth using a scroll through option

 ### Predict score page
- Working on Machine learning model so as to train the model for predicting the profile scores based on past data.
- The input attributes used to train the machine learning model have been decided based on which the profile score would be computed and decision would be made whether to accept the case or not.

### Split view Integration
Right after successful login , in the split view various options would be available using which the legal advisor can navigfate through to the corresponding page.





















