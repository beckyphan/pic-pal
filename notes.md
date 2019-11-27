# App Summary
My app idea is _`my_app_name`_. It will do all the things and it will be awesome! Your notes.md doesn't need to be as formatted as this example. What's most important is that you get your ideas down.

# Schema
### User (from devise + username attribute)

attribute  | attribute type
---------- | :-------------:
email | string
username  | string
password  | string

<br>

### Movie

attribute   | attribute type
---------   | :-------------:
name       | string
genre      | string
image_url  | string
<br>

### Event

attribute   | attribute type
---------   | :-------------:
title       | string
datetime    | datetime
location    | string
host_id     | integer
movie_id    | integer

### Review

attribute   | attribute type
---------   | :-------------:
title       | string
description | text
reviewer_id | integer
movie_id    | integer
rating      | integer

------------------------------------------------

### Models
#### User
has_many :events, as a host
has_many :events, as an attendee
has_many :reviews
has_many :reviewed_movies, through :reviews

validates :email, presence: true

<br>


### Movie
has_many reviews
has_many reviewers, through reviews, class_name=user
has_many events

<br>

#### Event
belongs_to :host, class_name: "User"
belongs_to :movie

validates :host_id, uniqueness: { scope: :datetime message: "to prevent overbooking"}

<br>

#### Review
belongs_to reviewer, class=user
belongs_to movie

validates :movie_id, uniqueness: { scope: :host_id, message: "to prevent multiple reviews by same user" }

------------------------------------------------
##### Below are the detailed specifications for the Rails Assessment. Try to answer them as best you can. Again, no worries if you arent sure on a particular item - We can talk about it together!

#### Specs:
- [x] Using Ruby on Rails for the project
  <br>

- [ ] Include at least one has_many relationship
  * Example of one has_many relationship (e.g. x has_many y; User has_many Posts)
  <br>

- [ ] Include at least one belongs_to relationship
  * Example of one belongs_to relationship (e.g. y belongs_to x; e.g. Post belongs_to User)
  <br>

- [ ] Include at least two has_many through relationships
  * Example of one belongs_to relationship (e.g. x has_many z through y; e.g. User has_many Categories through Posts)
  <br>

- [ ] Include at least one many-to-many relationship
  * Example of many to many relationship (e.g. x has_many y through z, y has_many x through z; (e.g. User has_many Categories through Posts, Categories has_many Users through Posts)
  <br>

- [ ] The "through" part of the has_many through includes at least one user submittable
  * attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (think attribute_name e.g. post.title)
  <br>

- [ ] Include reasonable validations for simple model objects
  * list of model objects with validations e.g. User, Post, Category (see above)
  <br>

- [ ] Include a class level ActiveRecord scope method
  * model object & class method name and URL to see the working feature e.g. Category.most_posts URL: /categories/most_posts)
  <br> potentially --> movies with most reviews, movies with highest ratings, users with most reviews

- [ ] Include signup
  <br>

- [ ] Include login
  <br>

- [ ] Include logout
  <br>

- [ ] Include third party signup/login
  <br>

- [ ] Include nested resource show or index
  * URL e.g. categories/3/posts => using nesteed resources to help create new
  <br>

- [ ] Include nested resource "new" form
  * URL e.g. categories/7/posts/new)
  <br>

- [ ] Include form display of validation errors
  * form URL e.g. /posts/new)
  <br>

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
