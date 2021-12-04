# sports-tracker

1. App Name: Our app's name is "score!".
2. App Tagline: An app designed for all Cornell Sports enthusiasts, score! helps its users keep track of Cornell Sporting events.
3. The ios team members' repository can be found here: https://github.com/erin-xu/sports-tracker
4. [Insert Screenshots]
5. App Description: The purpose of score! to make tracking and keeping up with Cornell sports easier for Cornell's incredibly busy students. It is an app which, on its backend, maintains an API of Cornell sporting events, Cornell teams, and users. A team can host many events, and each event is owned by exactly one Cornell team. The backend provides an API which holds all the events that teams have posted, serialized into accessible and readable data about the event for the frontend. On the frontend, data is retrieved from the provided API, and organized so users can filter, sort, and view both completed and upcoming Cornell sporting events. Users are able to filter upcoming events by both type of sport and the team's gender (i.e. Men's Soccer vs. Women's Soccer). Users are also able to access a list of a specific team's upcoming and completed events. When viewing an event, users see the time, date, and location of the event (and if the event has been completed, the score and whether Cornell won or not). 
6. iOS Requirements:        Utilizes NSLayoutConstraint.  Implements UICollectionView. Uses UINavigationController to navigate between screens. Integrates the API provided by the backend for data retrieval regarding the information for the sport evnets.  
   
   Backend Requirements:    The backend provided an API which both met and passed the outlined requirements. Our API implements 14 routes (including GET, POST, and DELETE methods), where 4 are required (note: the frontend does not yet utilize all provided routes, but does use more than 4 of the required routes). Our database houses three tables (User, Team, and Event Tables) and an association table between the User and Team tables, as well as relational keys between the Event and Team tables. Finally, an API specification is provided below for all 14 of the routes (both those utilized and not yet utilized by the frontend).
   
7. Other Notes: The backend implemented routes that haven't yet been implemented by the frontend. We believe in the future these rotes could be used to enhance the features and functionality of the app. For example, the capcity for user's to create password-protected accounts and to select favorite teams already exists within the backend.

to edit:

git add .

git commit -m "<your-message>"
  
git push


to get stuff:
  
git pull


:q <hit enter>
