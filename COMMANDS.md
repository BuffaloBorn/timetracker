# timetracker


## 04_01 - Creating a Rails App

```bash
$ rails new timetracker
$ cd timetracker
$ ls
$ vi GEMFILE

```
##### At the beginninh of the file, add the following lines to include in our project's GEMFILE that we've created

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

[Layouts And Rendering](guides.rubyonrails.org/layouts_and_rending.html)

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

Asset pipeline will automatically include all the files in the asset folder

Remember that asset pipeline will minitify all the css and javascript into one file when deployed into the production environment. But for development it will render individally files to allow you to see the functions and definitions to complete the development cycle. 

## 06_05-06_05-Styling The Global Template - Turbolinks

[Rails Tubrolinks](https://github.com/turbolinks/turbolinks)

Add reset.css is base on [Normal.css](http://necolas.github.io/normalize.css/) that makes browsers render all elements more consistently and in line with modern standards. It precisely targets only the styles that need normalizing.

Turbolinks can track the URLs of asset elements in <head> from one page to the next, and automatically issue a full reload if they change. This ensures that users always have the latest versions of your application’s scripts and styles.

Annotate asset elements with data-turbolinks-track="reload" and include a version identifier in your asset URLs. The identifier could be a number, a last-modified timestamp, or better, a digest of the asset’s contents, as in the following example.
Turbolinks can be disabled on a per-link basis by annotating a link or any of its ancestors with data-turbolinks="false".

From within the general.css:140, there is a media query (_@media only screen and (max-width: 699px)_) that looks at the width of the view pane and if that view pane goes under 699px; it will response accordingly.  

## 06_06-Layouts And Rendering - How Does Rails Choose A Template

[Layouts And Rendering](http://guides.rubyonrails.org/layouts_and_rending.html)

How does rails put a view to render?

```bash
rake routes
```
Rails looks at the request and picks the first entry that matches against pattern within the routing table.

Inside the cntroller, you can issue the following rendering options:

```ruby
render nothing: true
```
or 
```ruby
render text: 'Hey there'
```
Above can be used in javascript response wantd as a feed, anything after the render statement is ignore. More often is seen response_to block

```ruby
    respond_to do |format|
        format.html #show.html.erb
        format.xml {render xml: @company}
        format.json {render json: @company}
    end
```

This apart of convention over configuation that rails promote. The convention of requsting html, json or xml is server that having to setup a separate configuation to handle these request. 


## 06_07-Looping Over Collections In Views

In this section, we see how the belong_to and has_many relations can be easily access. 

## 06_08-Adding A To_S Method To Models

It would be nice in a view templete to express more then an model's property and any other property that is associated with model. For example:

```ruby
    <tr>
        <td><%= link_to project.name, project%></td>
        <td><%= link_to project.company.name, project.company %></td>
    </tr>

```
to

```ruby
    <tr>
        <td><%= link_to project, project%></td>
        <td><%= link_to project.company, project.company %></td>
    </tr>
```

As you can notice, the name property is removed and the we are just calling the model name which in turn call the to_s method defined inside the model class. 

## 06_09-Looping Over Collections - Exercise Review

refer to commited code for this section

## 06_10-Displaying Related Items In The Show View

For each show.html.erb, it would be nice to include the association data like the belong_to portions. 
This adds a bit useful functional for the users. Where they can see how the data is set without having to go back and forth between pages

## 06_11-Partials And Content_For

[Layouts And Rendering](http://guides.rubyonrails.org/layouts_and_rending.html)

In our project, we have a section label aside that allows us to insert content in the layout by using the content_for with aside varinale. This can be include on any view template. By default, rails will look in the same directory for the partial defined in the view template. 

## 06_12-Partials For Re-Used Content

When you use the same code is used in multiple places then this a great reason to use partials. Pull the code into a partial, rails provide helper methods that allow to pass in collection type, like array, and render partial for each item in the collection. If we just copy from one view template to another. It may return the following error:

ActionView::Template::Error (Missing partial projects/_work, application/_work with {:locale=>[:en], :formats=>[:html], :variants=>[], :handlers=>[:raw, :erb, :html, :builder, :ruby, :coffee, :jbuilder]}. Searched in:
  * "C:/Users/camcgruder/git/timetracker/app/views"
):

so it must be instucted to look in the same page/view template folder as the original 

```ruby
<%= render partial: 'work', collection: @project.works %>  
```
 to

```ruby 
<%= render partial: 'works/work', collection: @project.works %>
```

## 06_13-Partials For Re-Used Content - Exercise Review

refer to commited code for this section

## 07_01-Forms Overview

Review of the blog's application - forms and partials

## 07_02-A Create Form For Companies

refer to commited code for this section

## 07_03-Form Helper Methods And Styling The Forms 

It very important to pay attention to the intance variable in the form_for

Check out _2. Dealing with Model Helper_ in the [Form Helpers](http://guides.rubyonrails.org/form_helpers.html)

[API Form Helpers](http://api.rubyonrails.org/v5.1/classes/ActionView/Helpers/FormHelper.html) show various types form helpers plus overview of what can be added to form helpers

[Making select boxes with ease](http://guides.rubyonrails.org/form_helpers.html#making-select-boxes-with-ease) has good way in how to make select boxes. Rails makes this painless but not to easy

## 07_04-A Create Form For Works

refer to committed code for this section

## 07_06-Saving The New Object - The Create Action

```bash
bundle exec rails routes
```
Below provides a route that allows us to send data back to the controller and creates model object to saves a new record to the database. 

```ruby
  POST   /companies(.:format)                companies#create
```

For the controller point, we can create method name create that accepts a 

```ruby 
   def create 
    @company = Company.new(params[:company].permit(:name))
    @company.save
    redirect_to @company 
   end
```

where __[:company]__ acts like a namespace or collection that can perfixed and hold multiple parameters that can de-referenced. The __.permit__ is a rails security feature that allows particular fields to be mass updated in a model object. __@company.save__ does the actual record creation to the database. 

Note we are not providing a _if statement_ around the __@company.save__; we are allowing whatever outcome of the _save_ method to occurr; there could be a validation routined fired/handled but in this case it just be sallowed. 

Rails provides a flash buffer to allow messages to be available across view templates. The flush can be named anything in must case it is called _:notice_

The flash buffer is only available in one previous actions. If the page is refreshed the buffer will be clear out and the message will disapper. 

## 07_07-The Create Action For Works

refer to committed code for this section

## 07_08-The Create Action For Projects - Exercise Review

What happens when saving record fails validation with __.save__ method?

```bash
Started POST "/projects" for 127.0.0.1 at 2017-08-08 22:54:04 -0400
Processing by ProjectsController#create as HTML
  Parameters: {"utf8"=>"✓", "authenticity_token"=>"lq+v2xVr6QA43o+2bGKO5GsUJSm6EoudV81SCg765AgJ7jxD1THDxwhWamr71gTxl+LHpwKC4QWid68gb16dKw==", "project"=>{"name"=>"", "slug"=>"", "default_rate"=>"", "company_id"=>""}, "commit"=>"Create Project"}
Unpermitted parameter: :slug
  (0.0ms)  begin transaction
  Project Exists (1.0ms)  SELECT  1 AS one FROM "projects" WHERE "projects"."slug" IS NULL LIMIT ?  [["LIMIT", 1]]
   (0.5ms)  rollback transaction
Redirected to http://localhost:3000/projects
Completed 302 Found in 102ms (ActiveRecord: 1.5ms)
```

From this output, we can see that it fails the following model's slug validation
```
 validates :slug, uniqueness: true
```
It tranlate to the following sql statement:

```
 Project Exists (1.0ms)  SELECT  1 AS one FROM "projects" WHERE "projects"."slug" IS NULL LIMIT ?  [["LIMIT", 1]]
```

## 07_09-Validation And Forms

refer to committed code for this section

## 07_10-Validation For Works

refer to committed code for this section

## 07_11-Validation For Projects - Exercise Review

refer to committed code for this section

## 07_12-Writing An Edit Form

```bash
bundle exec rake routes
```
It can be used as a link within show.html.erb 

```
edit_company GET    /companies/:id/edit(.:format)       companies#edit
```

The new.html.erb can copied over to edit.html.erb plus updates to the page header and button label

## 07_13-An Edit Form For Works With Refactoring

We can create partials to extract form functionial and save the new.html.erb as a edit.html.erb to save time. Now the guts/content of the two view templates are in one place, not different places. One thing about this setup, is that the buttons will always show the same as the form you copied. So you need to make adjustments, to allow the flexiablity on this setup. Inside  the _f.submit_, you place code like below: 

```ruby
<%= f.submit @work.new_record? ?  "Create Work" : "Update Work" %>
```
where __.new_record?__ is a boolean operation and check if it a new record or edit exiting record

## 07_14-Writing An Edit Form - Exercise Review

Same refactoring steps for company and works - refer to committed code for this section