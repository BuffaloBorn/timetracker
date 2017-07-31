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
> 
> w.save
```