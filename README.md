## 44643Sec04Team05Spring2024FinalProject
# Legal Case Management System - One stop solution with all Workflows and process design
Its an Enterprise Resource Software to manage the entire lifecycle of Legal cases. 

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
![UI](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/143151335/632dbdad-99e9-4b6b-94df-1a6ec28aae6e)

### Screen1--LOGIN SCREEN


![Screen1](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/143151335/ab831aaa-18e0-4bb4-a926-45a65c588086)

### Screen2 -- DashBoard
![screen2](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/143151335/9d2c9910-817d-463d-a608-d698d463a76d)

### Screen3 -- PARTY/CLIENT INFORMATION SCREEN 
![screen3](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/143151335/915e8c89-662c-4b81-9ad3-c5881d7ac8bb)

### Screen4 -- LIST VIEW BASED ON SPECIFIC MATTER (CASE)
![screen4](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/142938211/0fda3a56-32e3-41c3-8c5c-f04f0b3e86f4)

### Screen5 -- PARTY/CLIENT RELATED BASIC DETAILS
![screen5](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/143151335/901f5f36-4db6-4a90-af2c-0d967dcaf43b)

### Screen 6 -- CLIENTS DETAILED CASE INFORMATION
![screen6](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/143151335/1ff139a1-c65f-45c7-8391-682afb37c214)

### Screen7 --  VISUALIZATION SCREEN
![Screen7](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/143151335/cd9daa26-2331-40a0-93f3-980b9d8eef0f)

### Screen8 --  profile score check
![screen8](https://github.com/AjitUbbanapally/44643Sec04Team05Spring2024FinalProject/assets/143151335/936dce05-5e3f-42e8-8de3-cd3ccf473c92)


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
















