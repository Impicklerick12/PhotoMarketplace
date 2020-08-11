# PhotoPlace
## The one-stop-shop for all your Photography needs!

![PhotoPlace Logo](docs/photoplace_logo.png "PhotoPlace Logo")

by Tyler Hall

My Depolyed App - [https://fathomless-oasis-65004.herokuapp.com/](https://fathomless-oasis-65004.herokuapp.com/ "PhotoPlace Marketplace")  
Link to my GitHub Repo - [https://github.com/Impicklerick12/PhotoMarketplace](https://github.com/Impicklerick12/PhotoMarketplace "Marketplace App GitHub Repo")

### Why should an app exist for this?
PhotoPlace was developed out of a need for people searching for photographers, but also photographers looking to advertise their work and provide listings for the services and products they provide. In my previous experience as a freelance photographer, it was hard to find consistent work. The process of marketing can feel pointless at times, and what mediums are best for self-advertising? On the other hand, it is also difficult to find an experienced photographer without having to sift through multiple google search pages, instagram profiles and more. It would be a lot easier if photographers and customers alike were about to connect on the one platform, which is what PhotoPlace aims to do.

##### Purpose
PhotoPlace aims to connect photographers and customers. It’s purpose is to solve two common problems when acquiring photography services, the difficulty in finding an appropriate photographer, and on the other side of the coin, the difficulty in finding work for freelance photographers. PhotoPlace allows photographers to post ‘listings’, which can be any form of service they wish to provide, such as a portrait photography session, a workshop or even a piece of art. Instead of shopping and browsing across a variety of apps and websites, PhotoPlace is a one-stop-shop for photography services. Users are able to search for specific types of listings, instead of having to ask a photographer what their rate is for a certain service, it can be laid out in the form of a listing with a set price. 

##### Functionality / features

* User Authentication

Firstly, anyone looking to view the profiles and listings on PhotoPlace need to sign up using an email and password. Once they sign up they now become a user, and can view all profiles and listings

PhotoPlace allows users the choice to create a profile if they wish, which represents a photographer's profile page. If they are simply browsing and are looking for a photographer to work with, they do not need to and can still perform actions on the site as a user. 

* Authorisation

Users are only able to create one profile, which can contain information about themselves and their professional photography experience such as their name, social media links and a bio. Profiles are able to create many listings, which are essentially products or services that the photographer provides. These listings are editable only by the profile user, and contain information relevant to the service such as the description, category of service, and price. 

Within each profile page (show page), there is a reviews section at the bottom. This was created so that users and photographers alike were able to leave comments and reviews about profiles, giving real feedback regarding the quality of work that the photographer provides. Finally, there is an area where all of the listings are provided, so that any user is able to filter through them to find their desired category or service. 

* Feature Photographers

The home page contains information regarding the use of the app, as well as a selection of featured photographers. These were created through eager loading, selecting the top 3 profiles.

* Categories

The home page also contains a visualisation of some of the categories that are enabled in the PhotoPlace application. Each listing can be marked with a category, with future implementation including a search function that will show listings for each category.

* Image Upload

Each profile has the ability to upload an image to use as their profile image. This was accomplished using active storage in Rails. This profile image is attached to their profile through the profile model (has_one_attached :photo) and is able to be used throughout the site. When the profile makes a review on any profile, their photo is used, and if they do not have a profile or profile photo, a stock image is attached.

* Reviews

Reviews are attached to a single profile id. So the review routes are nested within the profile routes, where only the create function is enabled. Each review contains information regarding to its columns, including the body of text, the profile id it is attached to, and the user id of the user who placed the review.

* Pagination

The pagy gem was used to limit the number of profiles and listings shown on each index page. Once the user base of the app grows, the index pages can become over populated with data, causing slower performance and loading. By limiting each page to 10 or 12 profiles/listings, we are able to scale the app effectively.

* Eager Loading Principles

Eager loading was implemented to improve the N+1 query issues. By using the includes and find methods, and specifying any relations, we are able to limit the database quiries and find the exact matching data point from the params.

##### Sitemap
![PhotoPlace Sitemap](docs/photoplace_sitemap.png "Portfolio Sitemap")

##### Screenshots
![Some Screenie](docs/some.png)

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

## User Stories
* Users can create an account
    * Users can edit email and password

* Users can sign up, log in and log out
    * Users can stay signed in on their selected browser
    * Users can delete user account

* Users can view all profiles, listings and  reviews

* Users can write reviews on profile pages

* Users can create a photographer profile
    * Profile can contain a name, description, profile photo and social media links

* Profiles can create listings
    * Listings contain information such as a title, description, price and category

* Profiles are only able to edit and delete their own profile and listing information
* Profiles are able to leave reviews on other profile pages

##### Wireframes

###### Landing Page
![Landing/Home Page](docs/landing_page.png "Landing/Home Page")

###### New Listing Page
![New Listing Page](docs/new_listing.png "New Listing Page")

###### Profile Show Page
![Profile Page](docs/profile_page.png "Profile Page")

###### Profiles Index Page
![Profiles Index Page](docs/profiles_index_page.png "Profiles Index Page")

###### Sign Up/Log In Page
![Sign Up/Log In Page](docs/sign_up_log_in_pages.png "Sign Up/Log In Page")

##### Task Management
![Trello Board Week 1](docs/trello_board_week1.png "Trello Board Week 1")
![Trello Board Week 2](docs/trello_board_week2.png "Trello Board Week 2")
![Trello Board Week 3](docs/trello_board_week3.png "Trello Board Week 3")


## Data Structure
##### Entity Relationship Diagram

Below is my initial visualisation of my ERD for the PhotoPlace diagram. The relationships are defined on the bottom left side of the image, where any foreign keys are matched to their corresponding primary key, and what type of relationship it is. I would love to implement an order function and table, where users are able to select listings and place them into an order, to purchase through the application via stripe payment. 

![PhotoPlace First ERD](docs/erd_first.png)  

### High Level Look at Various Components

##### User authentication

User authentication was neccesary to prevent anyone being able to use the application and access or adjust any records in the database. Devise is an incredibly helpful gem that provides the framework for the authentication, creating the models, views and helpers for us to implement. In my case, I wanted to only allow visitors to the application to access the home page and how this works page. Both these pages describe what the application does, and why you should sign up. If a visitor clicks a link to view deeper into the app, they will be redirected to the sign up page.

##### Authorisation

If authorisation was not implemented in Photoplace, any users would be able to edit listings or profiles of any other users. This would be disastrous. It was essential to only allow users to edit their own information, so statements were used to find out if a user would be able to perform an action. Embedded ruby code consisting of if/else statements were used to check if a user was signed in, and would either display links or not. Helper methods were also implements to make similar checks for profiles and reviews. 

##### Categories

Adding categories to each listing was always a target, and then be able to create search functions that will limit responses to those categories. I was able to add a category table, which then could be referenced when a profile created a listing. I felt that by providing categories of listings, it might clarify for users what the essence of the application was, to provide services that a photographer profile provides. If a user did not want to search through all photographers, they could simply search through the categories to find what they are looking for. 

##### Image Upload

The ability to upload images is essential for any marketplace application. A profile with an image attached of the photographer looks more professional and reliable than one that doesn't. That image is then able to be used across the website, as a avatar for that profile. Future implementations would include adding multiple image upload for the listings, showcasing any products being sold, or visual representations of the listings.

##### Reviews

I feel reviews are a necessary part of all marketplace applications. When shopping for products or services, we rely on reviews to give honest feedback, and then ultimately use that information to make an informed decision. By allowing users to leave reviews for profiles, it will enable a completed perception of that profile.

### Third Party Services

* **Github** 

Cloud based storage and hosting for software development, incorporating version control.

* **Heroku**

Container-based cloud platform used to deploy, manage and host web apps. Free service for smaller projects like this one, easy to use through the command line and Git integration.

* **AWS S3**

Cloud hosting service for image storing.

##### The Models
Rails uses Active Record associations to create the relationships between different models. These associations enable us as developers to specify how each model is related, and also the extent to how they are related. 

In my Rails application, my **User** model was created through the use of the Devise ruby gem, which is designed for user authentication. A user is created when someone signs up to the app with an email and password. My User model includes Active Record associations that allow them to create one Profile (has_one :profile), and also create many reviews on any profile that they wish (has_many :reviews). Both associations include dependent: :destroy, which will remove any associations that are attached to that model if it is deleted. This will ensure that there are no orphaned records in the database.

The Active Record associations in my **Profile** model include belongs_to User, creating a connection between the profile model and a user ID. Next the association has_one_attached is related to a photo, which is stored within Active Storage in Rails. When setting up image upload, Active Storage is installed on rails, and helper methods are created to include a file upload field in forms, then a variable :photo can be attached to it, which connects the uploaded file to the profile when permitted in the params. The next Profile model association is in connection to the Listings model, has_many :listings, dependent: :destroy. This made the association that any profile can have many listings, and if the profile is to be deleted, then their listings would also be destroyed. The final association, which is the same relationship as with the listings, is has_many :reviews, dependent: :destroy. This allows the profile to contain many reviews, which independently have their own reference with a user ID.

Inversely, my **Listing** model belongs_to :profile, and also belongs_to :category. This completes the association between the models, ensuring that the listing data entry cannot be orphaned if it is associated with a model with a dependent destroy attachment.

My **Category** model only has one association, which is has_many :listings. This means that any one category can be used across multiple listings.

Finally, my **Review** model includes the belongs_to association with my User and Profile models. This association allows the connection with a profile, which is where the reviews will be displayed, and also to the user who is placing the review. The last association is validates :review, presence: true, allow_blank: false. This association validates that the associated object is present, and also that the provided text field for the review cannot be left blank and submitted. 

##### The Relations

The relations in PhotoPlace are represented in the Entity Relational Diagram above, which is a visual representation of the database tables in my PostgreSQL relational database, and how each relates to the others. Each table has a title, eg. User, and comprises of several columns that are populated with data each time that corresponding form is completed on the app. The tables contain a primary key, typically represented by the table ID. Any other tables that need to reference another table utilise a foreign key as their input for a column. This is described in the Profile table, which has a user_id column which is a foreign key connecting it to the primary key of the User table. 

My application was designed so that everyone who signs up to PhotoPlace is a user, and each user has the option to create a photographers profile if they wish to advertise their services. Each user is only able to create one photographer profile, as there is no reason for a user to create more than one. This was achieved through the active record relations, making a correlation between the current_user.id and the profile.id, and also some user verifications in my views and my profile controller. I created some helper methods to determine if they current user had created a profile (Profile.exists?) and if true, then the verifications would prevent them from creating any new profiles by redirecting them back and providing an error message. The same verifications allowed me to customize the buttons in the nav bar, to prevent the “Create Profile” button from showing.

Once this was achieved, my next relation involved a profile being able to create multiple listings. Each user has the ability to create many listings (has_many), and subsequently each listing must belong to one profile, referencing their ID. 

Each profile also has many reviews, which in turn belong to only one profile. These reviews are associated to only one profile, and contain information regarding the body of the comment/review, and references to the profile ID and the user ID that placed the review. 

Lastly, each listing that is created has relations to multiple entities, such as the profile that created it and to a category that it belongs in. A listing is referenced to the profile ID that it belongs to, and similarly to a category ID referencing which type of category.  

#### Database Schema Design

Below is the final version of my database ERD. Unfortunately as I was unable to implement stripe into my application, the orders table was never created. Also the implementation of the social media links was quite a late addition also, so I simply migrated new columns into the Profile table to include the addition of the users website and instagram URLs. In the future I would prefer to revert this back to a Socials table which can contain any links to the users social media URLS, allowing other interested users to browse their complete body of work.

![PhotoPlace ERD](docs/photoplace_erd.png) 

##### Task Allocation

**Week One**

* Create wireframes for all pages, in different devise sizes
* Start Entity Relationship Diagram (ERD)
* Create Sitemap for application

**Week Two**

* Create new rails app with PostgreSQL database
* Use devise to create users
* Generate scaffold to create user profiles, inclding the information contained in that profile (name, description)
* Connect each profile to only one user (profile_id == current_user.id)
* Generate scaffold to create listings, including their title, description, price, and profile id
* Connect each listing to only one profile (profile_id == current_user.id)
* Implement Bulma for CSS framework

**Week Three**

* Start to style each page with bulma
* Generate reviews model, to be connected to profiles controller
* Reviews contain data such as the body of text, profile id, and user id of user placing the review
* Implement user authorisations, cannot edit/delete/create listings for other profiles
* Improve navbar to show buttons/links for different users
* Add new Category table, include name and description
* Migrate new column to listing table for category id
* Populate database with categories
* Create new test profiles, listings (with categories)
* Bug fixes and styling to all pages
* Seed database with users and profiles
* Update ERD with actual tables from schema