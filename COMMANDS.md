# timetracker


## 04_01 - Creating a Rails App

```bash
$ rails new timetracker
$ cd timetracker
$ ls
$ vi GEMFILE

```
##### At of the file, add the filling line to include in our project that we've created

```
source 'https://rubygems.org'

gem 'devise'
gem 'will_paginate'
```

```bash
$ bundle install

```
## 04_02 - The Rails Console

```
Company
    - Names
User
    - First Name
    - Last Name
    - Company
Project
    - Name
    - Company
    - Default Rate 
Work
    - Project
    - User
    - Date Preformed
    - Number of hours
 
    
```
## 04_03 - Creating Models

```bash
    $ rails g model Company
    $ rake db:migrate
    $ rails g model Company
    $ rails g model Company
```

## 04_04 - Creating Models

```bash
    $ rails g model Company
    $ rails g model User
    $ rails g model Project
    $ rails g model Work
    $ rake db:migrate
```
## 04_05 - Associations

```
refer to commited code for this section
```
## 04_06 - The Rails Console

##### Note: These commands allows for extracting the need to use complex sql statements that would be imbeded in PHP code. For large scale whie indepth business logic in overly used without the code structure.  


```bash
rails c 
```
```ruby
> User.first
> Company.first
> Project.first
> u = User.new
> u.fname = "Brian"
> u.lname = "Hoke"
> u.save
> u
> c = Company.new
> c.name = "Bently Hoke"
> c.save
> u.company = c
> u.save
> u.company
> u.company.name
> c.users
> c.users.first
> c.users.first.fname
> exit
```

```bash
rails c 
```

```ruby
> u
> User.first

```
## 04_08-Many-To-Many Associations - Testing Via The Console

```bash
$ rails c
```

```ruby
> Project.first
> p = Project.new
> c = Company.first
> p = Project.new
> c2 = Company.new
> c2.name = 'Client Inc.'
> c2.save
> p.name = "Project XYZ"
> p.company = c2
> p.save
> p
> p.default_rate = 60
> p.save
> u = User.first
> u.company
> p
> w = Work.new 
> w.project = p 
> w.user = u
> w
> w.datetimepreformed = '2013-12-10 10:03:02'
> w.hours = 2.5
> w.save
> u.works
> p.works
> u.projects
```

##  04_09-Rails Console - Adding Data

```
Company (Name)
    1. Bentley Hoke
    2. Client Inc.
    3. ABC, Ltd.

User (First Name, Last Name, Company)
    1.     name: Brian Hoke
        company: Bentley Hoke
    2.     name: Jane Doe
        company: Bentley Hoke
    3.     name: Ralph Martinez
        company: Client Inc.

Project (Name, Company, Default Rate)
    1.      name: Project XYZ
         company: Client Inc.
    default rate: 60
    2.      name: Second Proj
         company: ABC, Ltd.
    default rate: 125
    
Work (Project, User, Date Preformed, Number of hours)
    1. date/time : 2013-12-10 10:03:02
           user: Brian Hoke
        project: Project XYZ
         hours: 2.5
    2. date/time: 2013-12-11 17:24:57
            user: Jane Doe
         project: Project XYZ
           hours: 0.75
```
```bash
$ rails c
```
```ruby
> Company.all
> c = Company.new
> c.name = "ABC, Ltd."
> c.save
> c
> User.all
> u = User.new
> u.fname = 'Jane'
> u.lname = 'Doe'
> u.company = Company.first
> u.save
> u.company
> u = User.new
> u.fname = 'Ralph'
> u.lname = 'Martinez'
> Company.all
> u.company_id = 2
> u.save
> u.company
> Project.all
> p = Project.new
> p.name = 'Second Proj'
> p.default_rate = 125
> p.save
> p
> c
> p.company = c
> p.save
> p
> p.company
> Work.all
> w = Work.new
> w.dateperformed = '2013-12-11 17:24:57'
> w.hours = 0.75
> User.all
> w.user_id = 2
> p = Project.first
> w.project = p
> w.save
> Work.all
> my_user = User.find(2)
> my_user.projects
> my_user.works
> c
> c.projects
```

## 04_10-Fixtures

```bash
$ rake db:fixtures:load
$ rails c
```
```ruby 
> User.all
> Company.all
> User.first.company
> Project.all
> Works.all
```

## 04_11-Migrations - Changing A Field

```bash
$ rails g migration change_hours_field_in_works_to_integer
$ rake db:migrate
```

## 04_12-Fixtures - Exercise Review

```
Company (Name)
    1. Bentley Hoke
    2. Client Inc.
    3. ABC, Ltd.

User (First Name, Last Name, Company)
    1.     name: Brian Hoke
        company: Bentley Hoke
    2.     name: Jane Doe
        company: Bentley Hoke
    3.     name: Ralph Martinez
        company: Client Inc.

Project (Name, Company, Default Rate)
    1.      name: Project XYZ
         company: Client Inc.
    default rate: 60
    2.      name: Second Proj
         company: ABC, Ltd.
    default rate: 125
    
Work (Project, User, Date Preformed, Number of hours)
    1. date/time : 2013-12-10 10:03:02
           user: Brian Hoke
        project: Project XYZ
         hours: 2.5
    2. date/time: 2013-12-11 17:24:57
            user: Jane Doe
         project: Project XYZ
           hours: 0.75
<% 10.times do |n| %>            
 work_<%= n%>
    [add fields here]
<% end%>

ruby ternary operator:
<%= n > 10 ? 'greater than 10' : 'less thn 10'%>
```
```bash
$ rake db:fixtures:load
$ rails c
```
```ruby 
> Company.all
> User.all
> Project.all
> Work.all
> Work.first.user
> Work.last.user
> Work.first.project
> Work.last.project
```
## 04_13-AR Query Interface

```bash
$ rake db:fixtures:load
$ rails c
```
```ruby 
> u = User.first
> u = User.last
> u = User.find(767380590)
> User.all
> u = User.find(767380590)
> w = Work.first(3)
> w = Work.last(2)
> u = User.find_by fname: 'Jane'
> w = Work.find_by hours: 23
> fulldayworkitems = Work.where('hours=?', 23)
> fulldayworkitems = Work.where('hours=23')
> lowdefaultrateprojects = Project.where('default_rate < ?', 100)
> companies = Company.order('name')
> companies = Company.order('name desc')
```

## 04_14-Scopes

#### Scopes are useful to place queries that done repeative over and over again. 

```bash
$ rails c
```
```ruby 
> Work.all
> Work.fullday
> exit
```
```bash
$ rails c
```
```ruby 
> Work.recent
> Work.recent.size
>
```

## 04_15-Validations

[Rails Validations](guides.rubyonrails.org/action_record_validations.html)

#### Validations make you rails apps database-agnostic. Allowng the capacity of rails app to function with any vendor’s database management system (DBMS).

```bash
$ rails c
```

```ruby 
> p = Project.new
> p.save
> p.errors
> p.name = "Some New Project"
> c = Company.first
> p.company = c
> p.save
> p.delete
> p = Project.new
> p.save
> p
> p.valid?
> p.name = "Some New Project2"
> c = Company.last
> p.company = c
> p.valid?
> p.save
> exit
```

```bash
$ rails c
```

```ruby 
> w = Work.new
> w.save
> w.errors
> w.hours = 'a'
> w.save
> w.errors
> w.hours = 0
> w.save
> c = Project.last
> w.project = c
> w.user = User.last
> w.hours = 2.5
> w.save
> w.errors
> w.hours = 2
> w.save
```
## 04_16-Validations - Exercise Review


```bash
$ rails c
```
```ruby 
> u = User.new
> u.save
> u.errors
> w = Work.new
> w.save
> w.errors
> w.project = Project.first
> w.user = User.first
> w.hours = 2.5
> w.save
> w.errors
> w.hours = 4
> w.save
> w.errors
> w.dateperformed = '2015-11-10 08:08:08'
> w.save
> w.errors
> w.dateperformed = '2011-11-10 08:08:08'
> w.save
```

## 05_01-Action Controller Overview

```bash
$ rails g controller companines
```

## 05_02-Routing And The Params Hash

```bash
$ bundle exec rake routes
```
## 05_03-Getting Values From The Model In Controller Actions

Reference the git log for the files that were added and modified.

## 05_04-Generating Controllers - Exercise Review

Adding Controllers

Add controllers, with index and show actions, for projects and for works

1. "rails g controller projects" (do the same for wors)

2. add routes for "projects" and "works"

3. create "index" and "show" actions in the controller for "projects" and for "works"

4. create "index.html.erb" and "show.html.erb" view templates for "projects" and for "works"

5. test it out: "rails s" from the command line

```bash
rails g controller projects
rails g controller works
```
After the view s and controller are filled in, run the following command:

```bash
rails s
```


## 05_05-Adding To Our Controllers And Routes

Added a root route to companies#index; this allows anyone to go to homepage without knowing any of controller or actions

Adding a named route, to your app as seen below, which provides a way to access the work_controller's index action: 

```ruby
get 'recentworks/:days' => 'works#index'
```
For seach engines,  we can embed (named routes) urls or for historial reasons for older applications can use these types of named routes to existug urls so they are not broken when trying to reference them. This fills in the realm of keeping api alive when cutting over to new applications

There are always to direct the action methods to use a particular model method base on the params passed with in the the controller.

```bash
rails s
```

## 05_06-Adding A Slug Route For Projects

Permalink is a way to blog post are expose as url without the system. 

Slugs are better ways to provide permalink were there are no spaces, funny characters, and single string that are unique among the database entries.

```bash
rails g migration add_slug_to_projects
bundle exec rake db:migrate
bundle exec rake db:fixtures:load
```
Remember: ':' is a wild card. So when using route like 

 get 'timetrackerproject/:slug' => 'projects#show' translates the following: 
 
 http://localhost:3000/timetrackerproject/xyz to  http://localhost:3000/projects/xyz
 
 We've modified the show method in the project controller to handle this type route
 
##### Note: Make sure to use the correct versions on the 'prefix verb' when using them in view templetes because *projects_path* is not the same as *project_path*. *project_path* needs a :id to render properly; where *projects_path* does not require :id

Below is example of the type error is generated when the *project_path* is used instead *projects_path*

```ruby
ActionView::Template::Error (No route matches {:action=>"show", :controller=>"projects", :slug=>"project-xyz"}, missing required keys: [:id]):
    4: <p>Default Rate: <%=@project.default_rate%></p>
    5: <p>Slug: <%= @projectb.slug %></p>
    6: 
    7: <p><%= link_to 'All Projects', project_path %></p>
  
app/views/projects/show.html.erb:7:in `_app_views_projects_show_html_erb___1921419614_58466820'

```

## 06_01-Action View Overview

[Rails Guides](guides.rubyonrails.org/layouts_and_rending.html)

## 06_02-Setting The Global Layout

```bash
rails s
```
## 06_03-06_03-Adding A Nav - Using View Helpers

You can leave this running for the following steps

```bash
rails s
```
In this section, you can refer to the commit comments

In general if you have view base logic, programming with if statements and loops it would not be a bad idea to abract that in a helper method. Sometimes it even better to convert code that display the navigation in an array if this type of code changes often. You can place the array in the application_helper.rb, the refactoring allows the code more maintainable in the near future. 


## 06_04-Asset Pipeline Overview - Adding Some Javascript

[Asset Pipeline](guides.rubyonrails.org/asset_pipeline.html)

Remember that asset pipeline will minitify all the css and javascript into one file when deployed into the production environment. But for development it will render individally files to allow you to see the functions and definitions to complete the development cycle. 
