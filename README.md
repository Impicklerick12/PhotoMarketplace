# PhotoPlace
by Tyler Hall

## The one-stop-shop for all your Photography needs!

My Depolyed App - [https://fathomless-oasis-65004.herokuapp.com/](https://fathomless-oasis-65004.herokuapp.com/ "PhotoPlace Marketplace")  
Link to my GitHub Repo - [https://github.com/Impicklerick12/PhotoMarketplace](https://github.com/Impicklerick12/PhotoMarketplace "Marketplace App GitHub Repo")

### Why should an app exist for this?
PhotoPlace was developed out of a need for people searching for photographers, but also photographers looking to advertise their work and provide listings for the services and products they provide. In my previous experience as a freelance photographer, it was hard to find consistent work. The process of marketing can feel pointless at times, and what mediums are best for self-advertising? On the other hand, it is also difficult to find an experienced photographer without having to sift through multiple google search pages, instagram profiles and more. It would be a lot easier if photographers and customers alike were about to connect on the one platform, which is what PhotoPlace aims to do.

## WorkingTitle: at a glance.

##### Purpose
PhotoPlace aims to connect photographers and customers. It’s purpose is to solve two common problems when acquiring photography services, the difficulty in finding an appropriate photographer, and on the other side of the coin, the difficulty in finding work for freelance photographers. PhotoPlace allows photographers to post ‘listings’, which can be any form of service they wish to provide, such as a portrait photography session, a workshop or even a piece of art. Instead of shopping and browsing across a variety of apps and websites, PhotoPlace is a one-stop-shop for photography services. Users are able to search for specific types of listings, instead of having to ask a photographer what their rate is for a certain service, it can be laid out in the form of a listing with a set price. 

##### Functionality / features
PhotoPlace allows users the choice to create a profile if they wish, which represents a photographer's profile page. If they are simply browsing and are looking for a photographer to work with, they do not need to and can still perform actions on the site. Users are only able to create one profile, which can contain information about themselves and their professional photography experience such as their name, social media links and a bio. Profiles are able to create many listings, which are essentially products or services that the photographer provides. These listings are editable only by the profile user, and contain information relevant to the service such as the description, category of service, and price. Within each profile page (show page), there is a reviews section at the bottom. This was created so that users and photographers alike were able to leave comments and reviews about profiles, giving real feedback regarding the quality of work that the photographer provides. Finally, there is an area where all of the listings are provided, so that any user is able to filter through them to find their desired category or service. 

##### Target audience
PhotoPlace is initially targeted at photographers looking to display their professional profiles and services. The appeal of PhotoPlace is a one-stop-shop for photographers, instead of having to use several different services and apps to provide information and advertising to potential clients. PhotoPlace relies on photographers creating detailed profile pages, and populating them with listings containing the services they provide. The second target audience is the general population who are searching for photographers to work with, searching for services such as product or wedding photography. This audience is able to interact with photographers, view their services, and leave reviews relating to their experiences. When PhotoPlace grows, it could accommodate a number of creative services such as videography, graphic design, and even software development.

##### Tech stack
PhotoPlace is a web app built using a variety of technologies, including a server-side framework, front-end css framework and various ruby gems. The full list includes:

* Ruby on Rails
Server-side web application framework written in the Ruby language. Utilizes a MVC framework.
* PostgreSQL
Open-source relational database management system. Flexible and compliant, built on the SQL language. 
* HTML5
* Bulma 
Open-source CSS framework based on flexbox. Uses universal class names and html syntax to create elements for a web page. Easy to use framework with intuitive class names made it super easy to create a great looking site. Also incorporates Font Awesome for remote access to icons that can be used site-wise.
* SCSS(SASS) 
Elements styled using SCSS, a CSS preprocessor. Utilized partials and universal variables to minimize written and inline CSS.

**Ruby Gems**
* Devise - User authentication
* AWS S3 - Amazon Web Services object storing service for image uploading
* Bulma - CSS framework
* Fake - Use fake information such as names and emails to populate the database

**Third Party Services**
* Github - Cloud based storage and hosting for software development, incorporating version control
* Heroku - Container-based cloud platform used to deploy, manage and host web apps. Free service for smaller projects like this one, easy to use through the command line and Git integration.
* AWS S3 - Cloud hosting service for image storing.


##### Sitemap
![PhotoPlace Sitemap](docs/photoplace_sitemap.png "Portfolio Sitemap")

##### Wireframes
![Some Wireframe](docs/wireframe.png)

##### Screenshots
![Some Screenie](docs/some.png)

##### Task Management
![Trello Board Week 1](docs/trello_board_week1.png "Trello Board Week 1")
![Trello Board Week 2](docs/trello_board_week2.png "Trello Board Week 2")
![Trello Board Week 3](docs/trello_board_week3.png "Trello Board Week 3")

## Data Structure
##### Entity Relationship Diagram
![PhotoPlace ERD](docs/photoplace_erd.png)  

##### The Relations
My application was designed so that everyone who signs up to PhotoPlace is a user, and each user has the option to create a photographers profile if they wish to advertise their services. Each user is only able to create one photographer profile, as there is no reason for a user to create more than one. This was achieved through the active record relations, making a correlation between the current_user.id and the profile.id, and also some user verifications in my views and my profile controller. I created some helper methods to determine if they current user had created a profile (Profile.exists?) and if true, then the verifications would prevent them from creating any new profiles by redirecting them back and providing an error message. The same verifications allowed me to customize the buttons in the nav bar, to prevent the “Create Profile” button from showing.

Once this was achieved, my next relation involved a profile being able to create multiple listings. Each user has the ability to create many listings (has_many), and subsequently each listing must belong to one profile, referencing their ID. 

Each profile also has many reviews, which in turn belong to only one profile. These reviews are associated to only one profile, and contain information regarding the body of the comment/review, and references to the profile ID and the user ID that placed the review. 

Lastly, each listing that is created has relations to multiple entities, such as the profile that created it and to a category that it belongs in. A listing is referenced to the profile ID that it belongs to, and similarly to a category ID referencing which type of category.  


##### The Models
TODO: Describe your projects models in terms of the relationships (active record associations) they have with each other


## User Stories
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## Other Stuff
### Third Party Services
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

### High Level Look at Various Components
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.