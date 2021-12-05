# score!
1. App Name: score!
2. App Tagline: _All things Cornell Sports!_
3. The backend team members' repository can be found here: https://github.com/DylanMcCreesh/AppdevHackChallenge
4. The screenshots below demonstrate the functionality and show the user interface of the app.

<img height="700" alt="ss1" src="https://user-images.githubusercontent.com/82056699/144698115-671e0685-0843-4fe3-8849-38aedd04fa91.png"> <img height="700" alt="ss2" src="https://user-images.githubusercontent.com/82056699/144698093-1b4e7336-fac8-4921-a512-03071f4d1b7d.png"> 

When the app is launched, the home screen is shown. On this screen, the next sports event is displayed at the top, along with the team, opponent, date, time, and location. More upcoming events are displayed below in a horizontally-scrollable collection view, including the date, team, opponent, and location. The “see all” button can be clicked to open the upcoming events page.  

<img height="700" alt="upcoming1" src="https://user-images.githubusercontent.com/57200368/144732037-89644aea-f176-4765-948d-96434d001174.png"> <img height="700" alt="upcoming2" src="https://user-images.githubusercontent.com/57200368/144732045-c5436c56-c8e4-4799-b881-c7a0dd7a002f.png">


On this page, all upcoming events can be viewed and searched through using gender and sport filters. The team, location, time, date, and opponent is displayed for each upcoming event.

<img height="700" alt="sport1" src="https://user-images.githubusercontent.com/57200368/144732053-2396a25f-bcb9-44e3-bb48-b31196db69f6.png"> <img height="700" alt="sport2" src="https://user-images.githubusercontent.com/57200368/144732054-6c79333f-cd4f-479a-a3f0-d74c5cf3a208.png">

Sports events can also be browsed by team. When clicking on a sports team on the home page, a new page opens with a complete schedule of past and future games. The date, opponent, and location is displayed for each of these events. If the event has already occurred, the result is displayed as well.


5. App Description: An app designed for all Cornell Sports enthusiasts, score! helps its users keep track of Cornell Sporting events. The purpose of score! to make tracking and keeping up with Cornell sports easier for Cornell's incredibly busy students. It is an app which, on its backend, maintains an API of Cornell sporting events, Cornell teams, and users. A team can host many events, and each event is owned by exactly one Cornell team. The backend provides an API which holds all the events that teams have posted, serialized into accessible and readable data about the event for the frontend. On the frontend, data is retrieved from the provided API, and organized so users can filter, sort, and view both completed and upcoming Cornell sporting events. Users are able to filter upcoming events by both type of sport and the team's gender (i.e. Men's Soccer vs. Women's Soccer). Users are also able to access a list of a specific team's upcoming and completed events. When viewing an event, users see the time, date, and location of the event (and if the event has been completed, the score and whether Cornell won or not). 

6. iOS Requirements:        Utilizes NSLayoutConstraint.  Implements UICollectionView. Uses UINavigationController to navigate between screens. Integrates the API provided by the backend for data retrieval regarding the information for the sport evnets.  
   
   Backend Requirements:    The backend provided an API which both met and passed the outlined requirements. Our API implements 14 routes (including GET, POST, and DELETE methods), where 4 are required (note: the frontend does not yet utilize all provided routes, but does use more than 4 of the required routes). Our database houses three tables (Fan, Team, and Event Tables) and an association table between the Fan and Team tables, as well as relational keys between the Event and Team tables. Finally, an API specification is provided below for all 14 of the routes (both those utilized and not yet utilized by the frontend).
   
7. Other Notes: The backend implemented routes that haven't yet been implemented by the frontend. We believe in the future these routes could be used to enhance the features and functionality of the app. For example, the capcity for user's to create password-protected accounts and to select favorite teams already exists within the backend.
