# timetracker


## 04_01 - Creating a Rails App

```bash
$ rails new timetracker
$ cd timetracker
$ ls
$ vi GEMFILE

```
##### At the beginning of the file, add the following lines to include in our project's GEMFILE that we've created

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
refer to committed code for this section
```
## 04_06 - The Rails Console

##### Note: These commands allows for extracting the need to use complex sql statements that would be imbedded in PHP code. For large scale while in-depth business logic in overly used without the code structure.  


```bash
$ rails c
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
$ rails c
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

#### Validations make you rails apps database-agnostic. Allowing the capacity of rails app to function with any vendor’s database management system (DBMS).

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

## 07_15-Forms And Ajax

[Working with Javascript in Rails](http://guides.rubyonrails.org/working_with_javascript_in_rails.html)

MIME types need to be adjusted to make the create response better base on the request(aka ajax calls)

Inside the _/projects/show.html.erb_

```ruby
<%= render partial: 'works/form', locals: {doajax: true} %>
```

we are placing doajax setting it to __true__

Inside the _/works/_form.html.erb_

```ruby
<% doajax = false unless (defined? doajax) %>
<%= form_for(@work, remote: doajax) do |f| %>
```
we have the (locals) variable that was sent over from the _"/projects/show.html.erb"_ view template and determines to enable ajax property on this form like below:

```html
data-remote="true"
```

JS view needs to be created to handle the dynamic updates on the current page

Make sure when using ajax that you applied the proper css class to the correct tags or your desired effect will not.
```html
<tr id="headerrow">
```
Above css label class was missing, this caused my ajax call to not locate the correct ```tr``` tag  

```js
.insertAfter('tr#headerrow');
```

## 08_01-Authentication Packages In Rails Filters

[Action Controller Overview](http://guides.rubyonrails.org/action_controller_overview.html)

[Action Controller Filters](http://guides.rubyonrails.org/action_controller_overview.html#filters)

[Devise](https://github.com/plataformatec/devise)

Place the following in the GEMFILE because the devise gem was not work with rails 5.1.3. Did some googling and was advise to use the version below:

```ruby
gem 'devise', git: 'https://github.com/plataformatec/devise.git'
```

```bash
buudle install
```

## 08_02-Installing Devise

```bash
$ rails g migration add_email_to_users
$ bundle exec rake db:migrate
$ bundle exec rake db:fixtures:load
$ rails generate devise:install
$ rails generate devise User
```
Go into the generated migration -> xxxx_add_devise_to_users and comment out the following line:

```
 #t.string :email,              null: false, default: ""
```

```bash
$ bundle exec rake db:migrate
```

Check the db/schema.rb for the with the new database updates

## 08_03-Using Devise

```bash
$ bundle exec rake db:fixtures:load

```
Add the following to any controller that you would like to require login before accessing

```ruby
class ProjectsController < ApplicationController
    before_action :authenticate_user!
```   

## 09_01-Mailers Overview

[Action Mailer Basics](http://guides.rubyonrails.org/action_mailer_basics.html)

[Sending Mail](http://guides.rubyonrails.org/action_mailer_basics.html#sending-emails)


```bash
$ rails g migration add_users_to_projects
$ bundle exec rake db:migrate
$ bundle exec rake db:fixtures:load
$ rails s
```
## 09_02-Creating And Invoking A Mailer

```bash
$ rails g mailer usermailer
$ rails s
```

Provide the configuration information that is set in the __/config/development__ for now
Remember that in the __/app/mailers/usermailer__, we can create email actions just like we have controller actions

This email action below, creates a instance variable just like controller, in which, the instance variable is available to the view template.

Note how this email action is making use of the _work.project.user.email_, focus on current work&lsquo;s  project that contain a user&lsquo;s email.

```ruby
  def workcreated_email(work)
    @work = work
    mail(to: work.project.user.email, subject: "Work Item Posted")
  end
```

At this point, the views that will be used with these email actions can be created in _/app/views/usermailer&#95;mailer_ directory

It is best pratice to create html and text version of the email templete that will be sent to the recipents
Because not all mail client can handle html version and text is needed to support them.

When invoking the email actions, its best pratice to place after a sucessfully record has been saved into the database. In our case, in the _/app/contoller/works.contoller.erb_ method _create_ allows the calling on the mailer defined mailer actions created in the UserMailer class

```ruby
   def create
        @work = Work.new(params[:work].permit(:project_id, :user_id, :datetimeperformed, :hours))
        respond_to do |format|
            if @work.save
                # Tell the UserMailer to send a welcome email after save
                UserMailer.workcreated_email(@work).deliver
                format.html { redirect_to @work, notice: 'Work Created' }
                format.js { }
            else
                format.html { render 'new' }
                format.js { }
            end
        end
    end
```

## 09_03-Mailer - Exercise Review

In the previous section, we generated a email everything a work item was created to _work.project.user.email_. This case, we going to send an email to the project&lsquo;s owner everytime the project gets updated.

In case, we also need to create a new mailer action that takes in a project and corporate that new method in the project controller within the udpate method is called after a project has been sucessfully udpated.

## 10_01-Uploading Files To The Server

[Rails Form Helpers](http://guides.rubyonrails.org/form_helpers.html)

[Rails Form Helpers: uploading-files](http://guides.rubyonrails.org/form_helpers.html#uploading-files)

Follow along the this uploading files section, place the code in the right locations.

## 10_02-Files - Exercise Review

When we are doing ajax calls, we do not want do a file upload process. So need code to prevent from happening.

We like tie in the file to the record that uploaded file should available for by adding a new column to _works_ table

```bash
$ rails g migration add_doc_to_works
$ bundle exec rake db:migrate
$ rails s
```

## 10_03-Exporting Content To CSV

Check if we can access the csv version of ```/projects```
```
http://localhost:3000/projects.csv
```

but you get the following error:

```bash
ActionController::UnknownFormat (ProjectsController#index is missing a template for this request format and variant.

request.formats: ["text/csv"]
request.variant: []):

```
so we need to add the following the ```/app/contollers/project_controller.rb``` index method

```ruby
    respond_to do |format|
			format.html
			format.csv { send_data Project.export_csv(@projects), type: 'text/csv; charset=utf-8; header=present', disposition: 'attachment; filename=contacts.csv' }
    end    
```
Add the following to the bottom of ```/app/models/project.rb``` model

```ruby
 def self.export_csv(projects)
    CSV.generate() do |csv|
         csv << column_names
            projects.each do |project|
            csv << project.attributes.values_at(*column_names)		
         end
    end
 end
```

## 10_04-CSV Exporting - Exercise Review

Here we want to have more control over how the csv is outputted to the file. We can created an array to force the headers be displayed how we would like

```ruby
   def self.export_csv(projects)
		CSV.generate() do |csv|
			csv << ['name','company','default_rate','created_at','owner','most recent work item']
			projects.each do |project|
				csv << 	[
						project.name,
						project.company,
						project.default_rate,
						project.created_at,
						project.user,
						project.works.order('created_at DESC').first
						]
			end
		end
	end   
```
## 11_01-Testing Rails Apps

[Rails Testing](http://guides.rubyonrails.org/testing.html)

Ensure we do not break any code, that was previous developed so test are great ways to perform this type of fail safe.

Checkout the _/test_ directory, you will find stubs for _/test/controllers/_ and _/test/fixtures/_ where already placed initial data to pre-populate database in the dev and test environments.

If we look at  _/config/database.yml_, each environment has a entry to store its dataset perform its regions activity. This allows us to work in dependent environment without worrying about cross environment data issues from development to production.

There are also test stubs in _/test/models_ make sure what we think is working correctly is actually working properly in the lowest levels.

Will look at the various ways to look at performing test:  

[ThooughBOT Shoulda](https://github.com/thoughtbot/shoulda)

[RSpec](http://rspec.info/)

[Factory Girl](https://github.com/thoughtbot/factory_girl_rails)

## 11_02-Using Fixtures

[Rails - Low down on fixtures](http://guides.rubyonrails.org/testing.html#the-low-down-on-fixtures)

Look at _/test/system/text&#95;helper.rb_, it instructs rails to load all fixture data into the test database  

```
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
```

Review the _/test/fixtures/company.yml_, note that yml layout entry is like a reference id ```[->]``` to the data below it

```yml
-> bentleyhoke:
        name: Bentley Hoke
-> clientinc:
        name: Client Inc.
-> abcltd:
        name: ABC, Ltd.
```
So we can reference this in other yml files as such, _/test/fixtures/companies.yml_:

```yml
brianhoke:
                fname: Brian
                lname: Hoke
  ----------> company: bentleyhoke
                email: bhoke@entleyhoke.com
   encrypted_password: <%= User.new.send(:password_digest, 'password') %>

janedoe:
                fname: Jane
                lname: Doe
  ----------> company: bentleyhoke
                email: jdoe@example.com

ralphmartinez:
                fname: Ralph
                lname: Martinez
   ---------> company: clientinc
                email: rmartinez@example.com
```
## 11_03-Writing Tests - Model Tests

[Rails Testing](http://guides.rubyonrails.org/testing.html)

[Rails Unit Testing Model (Model Testing)](http://guides.rubyonrails.org/testing.html#model-testing)

Make sure you run the followig commands in order if it your first time or recieved migration error when just running the second command below

```bash
$ bundle exec rake db:migrate RAILS_ENV=test
$ bundle exec rake test test/models/work_test.rb
```
The following assertion test emtered in  _/test/models/work_test.rb_

```ruby
class WorkTest < ActiveSupport::TestCase
  test "work should not save with no associated user" do
		work = Work.first
		assert work.valid?, "work should be valid"
		work.user_id = nil
		assert_not work.valid?, "work should be invalid"
   end
end
```
And we recieved the following output and everything passed without failure or errors

```bash
Run options: --seed 38148

# Running:

.

Finished in 11.806822s, 0.0847 runs/s, 0.1694 assertions/s.
1 runs, 2 assertions, 0 failures, 0 errors, 0 skips

```

Now we going remove the __not__ from last assertion and check uor reselts:  

```ruby
class WorkTest < ActiveSupport::TestCase
  test "work should not save with no associated user" do
		work = Work.first
		assert work.valid?, "work should be valid"
		work.user_id = nil
		assert work.valid?, "work should be invalid"
   end
end
```

Run the following commands:

```bash
$ bundle exec rake test test/models/work_test.rb
```

```ruby
Run options: --seed 21603

# Running:

F

Failure:
WorkTest#test_work_should_not_save_with_no_associated_user [C:/Users/camcgruder/git/timetracker/test/models/work_test.rb:8]:
work should be invalid


bin/rails test test/models/work_test.rb:4



Finished in 11.433480s, 0.0875 runs/s, 0.1749 assertions/s.
1 runs, 2 assertions, 1 failures, 0 errors, 0 skips

```

This results shows that _work&#95;valid?_ will pass if the following validates, this is defined in the _/app/models/work.rb_, if this is properly set as nil value or asserted to be negative or state as _asset&#95;not_

```
validates :user_id, presence: true
```

```
Run options: --seed 10160

# Running:

..

Finished in 11.913277s, 0.1679 runs/s, 0.4197 assertions/s.
2 runs, 5 assertions, 0 failures, 0 errors, 0 skips

```
Now we add assertion for the following validate within the _/app/models/works.rb_

```ruby
validates :datetimeperformed, presence: true
```

```ruby
class WorkTest < ActiveSupport::TestCase
  test "work should not save with no associated user" do
		work = Work.first
		assert work.valid?, "work should be valid"
		work.user_id = nil
		assert work.valid?, "work should be invalid"
   end

   test "datetimeperformed should not be in the future" do
		work = Work.first
		assert work.valid?, "work should be valid"
		work.datetimeperformed = Date.today + 2.years
		assert work.invalid?, "work should be invalid"
		assert work.errors[:datetimeperformed].any?, "work should have datetimeperformed error"
    end
end
```
```bash
$ bundle exec rake test test/models/work_test.rb
```

Just like before we have all assertion pass without failure or errors

```bash
Run options: --seed 7528

# Running:

..

Finished in 9.931832s, 0.2014 runs/s, 0.5034 assertions/s.
2 runs, 5 assertions, 0 failures, 0 errors, 0 skips

```

## 11_04-Writing Tests - Controller Tests

[Rails Testing](http://guides.rubyonrails.org/testing.html)

[Rails Functionall Testing for Controllers](http://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers)

__Questions that the functional test should answer:__

_Do a request that we submit return a validate status?_

_Do we get the page that we except to receive?_

_If the controller is supplying appropriate objects or collection for the view template?_

When the instance variables are simple; it does warrant to have functional test created to test these types controller methods. Where ther have more complex business logic that may change frequently while developing a solution.

For example,

```ruby
require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase

  test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:companies)
	end
end
```

```bash
$ bundle exec rake test test/controllers/companies_controller_test.rb
```

```
Run options: --seed 52763

# Running:

E

Error:
CompaniesControllerTest#test_should_get_index:
URI::InvalidURIError: bad URI(is not URI?): http://www.example.com:80index
    test/controllers/companies_controller_test.rb:7:in `block in <class:CompaniesControllerTest>'


bin/rails test test/controllers/companies_controller_test.rb:6

..

Finished in 11.896156s, 0.2522 runs/s, 0.4203 assertions/s.
3 runs, 5 assertions, 0 failures, 1 errors, 0 skips
```

If you noticed, we have ab error because do not have devise connected in the functional test controller.

Let add it and re-test

```ruby
require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase

--> include Devise::TestHelpers

  test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:companies)
	end
end

```

Afer adding the _include Devise::TestHelpers_, recieved the following message:

```

DEPRECATION WARNING: [Devise] including `Devise::TestHelpers` is deprecated and will be removed from Devise.
For controller tests, please include `Devise::Test::ControllerHelpers` instead.
 (called from class_eval at C:/Temp/ruby/lib/ruby/gems/2.2.0/bundler/gems/devise-71fc5b351a8e/lib/devise/test_helpers.rb:4)
Run options: --seed 22996

# Running:

E

Error:
CompaniesControllerTest#test_should_get_index:
NoMethodError: undefined method `env' for nil:NilClass



bin/rails test test/controllers/companies_controller_test.rb:7

..

Finished in 11.257912s, 0.2665 runs/s, 0.4441 assertions/s.
3 runs, 5 assertions, 0 failures, 1 errors, 0 skips
```

```ruby
require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase

include Devise::Test::ControllerHelpers

  test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:companies)
	end
end

```

There big disconnect with this version of Rails and the one that was shown in this section. I&lsquo;m using Rails 5.1.3 and think the author is using Rails 4.2

Need to re-work, these test base on the [current Rails testing page](http://guides.rubyonrails.org/testing.html)

## 12_01-Making Our App Better - Refactoring

Look at the sidebar, its repeated on index and side partial

Review app/views/layout/application.html.erb:

```ruby
<aside>
       <%= user_logged_in_msg %>
       <%= yield :aside %>
</aside>
```

to

```ruby
<aside>
       <%= user_logged_in_msg %>
       <% if content_for?(:aside)%>
	<%= yield :aside %>
       <% else %>
	<%= sidebar %>
       <% end %>
</aside>
```

Add the following code to  _app/helpers/application&#95;helper.rb_:

```ruby
  def sidebar
	unless ['sessions', 'registrations'].include?(controller_name)
		index_title = "All #{controller_name.capitalize}"
		index_path =  "#{controller_name}_path"
		new_title =   "New #{controller_name.singularize.capitalize}"
		new_path =    "new_#{controller_name.singularize.capitalize}_path"
		raw("Helper<ul>
<li><%= link_to index_title, eval(index_path) %></li>			
<li><%= link_to new_title, eval(new_project) %></li>			
</ul>")
	end
  end
```

add text ```'Helper'``` to help identify which version of sidebar is being rendered

go _/apps/views/companies/index.html.erb_ and delete to the following:

```ruby
<% content_for :aside do %>
 <% render 'sidebar' %>
<% end %>
```
Repeat the above this deletion of this code  for the following view templates [show, edit, new] for all view templates but leave app/views/works/new.html.erb un-modified. This will let us see which sidebar is a partial render and which one is a dynamic one.

These types of refactoring allows the developer the freedom to have implement specialize sidebars as partials for individial page sections and also provide globalize version within the application helper level.

## 12_02-Updating associations for maintainability

The User model is going though project and then go though works to connect proper association

Review _app/models/user.rb_, you can see how user's

```ruby
has_many :projects, :through => :works
has_many :projects
```

Its not very clear about ownership via the current relationship that is defined in the model

Also review the the db/schema.rb

the projects table dll, see that it has user_id, we need to fix that by creating migration
```bash
$ rails g migration change_user_to_owner_in_projects
```

In the migration add the following code:

```ruby
def change
	rename_column :projects, :user_id, :owner_id
end
```
Then run the following migration command:

```bash
$ bundle exec rake db:migrate
```

In app/models/project.rb
```ruby
belongs_to :user
```
to
```ruby
belongs_to :owner, class_name: "User"
```

Because rails will think that 'owner' is a straight mapping to a actual model; the model definition needs instruct rails its not; by adding the _class&#95;name_ augument add the correct model name

Now we need to update the /apps/views/projects/show.html.erb

```ruby
<p>Owner: <%= @project.user %></p>
```

to

```ruby
<p>Owner: <%= @project.owner %></p>
```
Now go back to the /app/models/user.rb

```ruby
has_many :projects_owned, :foreign_key => 'owner_id', :class_name => 'Project'
```

Need to update the following view templates:
* _app/views/user&#95;mailer/projectupdated&#95;email.html.erb_
* _/app/views/&#95;form.html.erb_


Note: By creating the _/app/views/companies/&#95;form.html.erb_ partial; it makes this even easier have these changes to be applied to:

* _/app/views/companies/new.html.erb_
* _/app/views/companies/edit.html.erb_

```ruby
<%= f.collection_select(:user_id, User.all, :id, :to_s, prompt: true) %>

to

<%= f.collection_select(:owner_id, User.all, :id, :to_s, prompt: true) %>

```

You see the pattern anywhere we have _.user_id_ change; it needs to be replace with _owner_id_; its better to express project.owner then project.user

In addition in replacing those values, make sure the dropdown are update as well.

## 12_03-Extended Exercise

Extended Exercise

1. Only logged in users can create a work item

	add before filter to works controller - need to use only:
	rails action controller overview#filters

	Notes: devise is wholesale (any user is appeared)  does not stop a particular user's actions

2. User for work item submitted or updated should be logged-in user

	remove user selection from works form
	change works controller create, update actions to set user from current_user

3. Add an "admin" role for users

	write before_filter in companies controller
	login as each user to test difference

4. Only admins can add/change a company

	write before_filter in companies controller
	login as each user to test controller

5. Add pagination for works display

	make sure GEMFILE has gem 'will_paginate'
	ckeck out "blog": posts controller, post index view, config/application.rb
	add paginate to @works in works index controller
	set how many to paginate on config/application.rb
	add pagintion links in works index view file (will_paginate @works)
	optionally, style pagination links

## 12_04-Extended Exercise Review - Part 1

We need to add before&#95;filter  _/app/controller/work.rb_

```ruby
before_action :authenticate_user!, only: [:new, :create, :edit, :update]
```

Now we wanted to use the current_user from devise to pass to Work model object

Will modify the following
```ruby
@work = Work.new(params[:work].permit(:project_id, :user_id, :datetimeperformed, :hours))
```
to

```ruby
@work = Work.new(params[:work].permit(:project_id,  :datetimeperformed, :hours))
@work.user = current_user
```

Plus we need to remove the selection/dropdown because  we not passing the user id to the work controller   

```ruby
	<div>
		<%= f.label :user_id %>
		<%= f.collection_select(:user_id, User.all.order('lname, fname'), :id, :to_s, prompt: true) %>
	</div>
```

Add admin role to user table via migration

```bash
$  rails g migration add_admin_to_user
$  bundle exec rake db:migrate
```

In the migration file, we add the following

```ruby
def change
    add_column :users, :admin, :boolean, :default => false
end
```

Now go to fixtures and add the add
```yml
brianhoke:
  fname: Brian
  lname: Hoke
  company: bentleyhoke
  email: bhoke@entleyhoke.com
  encrypted_password: <%= User.new.send(:password_digest, 'password') %>
  admin: true

janedoe:
  fname: Jane
  lname: Doe
  company: bentleyhoke
  email: jdoe@example.com
  admin: false

ralphmartinez:
  fname: Ralph
  lname: Martinez
  company: clientinc
  email: rmartinez@example.com
  admin: false
```
```bash
$  bundle exec rake db:fixture:load
```

Now we want to allow only admins the ability to go to the _app/controller/companies.rb_  

```ruby
class CompaniesController < ApplicationController

  before_filter :only_admins_create_update_company, only: [:new, :create, :edit, :update]
...

  def only_admins_create_update_company
		redirect_to companies_path, :alert => 'Only admins can create/modify a company' unless current_user.admin
 end
end
```
So anybody that is not admin we be redirected to companies index with a flush alert message

## 12_05-Extended Exercise Review - Part 2

Review the commits for this section.

## 13_01-Tips On How To Tackle A Rails App You Inherited

Here we are looking at the case; where you have inherited an application and there nobody to ask question about the in and outs of application

Now it up to you to figure out to get handle of the legacy application.

Go to the rails console, it give you starting point where and how the data is retrieve from the database

In this section, we will change directory and focus on the blog application that came the solution files for this course

```bash
$  cd blog
$  bundle install
$  rails console
```

```ruby
> p = Post.first
```

This shows what fields that are available in the model

Go to the actual model class and show all the validation and scopes defined

Back to the rails console, you can look and see where a method is defined

```ruby
Post.first.method(:sometherandommethod).source_location
```

Because some methods are not easy to locate, they can be buried in a gem or something not located in the current project
You can also check out this with class method

```ruby
Post.method(:somerandommethod).source_location
```

Another useful technique to use the routes commands


```bash
$  bundle exec rake routes
```

This allows you to see all the routes available within the application.

On the flip side, you can go the routes.rb and compare what is define in the routes file to what is in routes command output.

This shows how users interact with http url and other standard base actions.

## 13_02-Where To Find More Information

[Ruby on Rails](rubyonrails.org) - great starting point

[Rails API](api.rubyonrails.org) - dive deep into how rails really work

Search helper methods for extra parameters to add to known methods

[Planet Rails](www.planetrubyonrails.org) - Check out what the community is doing with rails

[Rails Guides](guides.rubyonrails.org)

[Twitter Account DHH](https://twitter.com/dhh?lang=en)

[Rails Cast](railscasts.com/)

CSS frameworks: Foundation and Bootstrap is a great addition to your skillset.
