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
