meap
====

###UPDATE###
The initial commit up through the commit on Dec 23, 2013 have been **moved to
the v1 folder**, as I have begun a second walkthrough of the book from the MEAP 
v17 release of the book.  **See v2 for the updated application**



A following of the Rails 4 in Action book by Ryan Bigg &amp; Yehuda Katz.

As my second tutorial and experience with Ruby on Rails, I intend to do this
one a bit differently, in making notes on each Chapter with core values that I 
have learned and feel are important concepts (more than anything, for future 
reference for myself), as well as the reasoning behind certain portions of code.

I intend for this to lead to a greater and in-depth understanding of RoR that 
will soon pave the way to put the thoughts and ideas I have into action.

Let's begin!

Basics
====

MVC (Model/View/Controller)
---
**Model** - application domain logic
- this includes database record retreival, validation and manipulation.

**Controller** - median between model (databases) and view
- calls methods on model classes which *return objects*
**returned objects**
- represent rows in the database
- can be single objects or collections of them
- made available to the *view* through *instance variables* 
performs permission checking
- ensures special permission functions (i.e. admin functions) are limited to that user

**View** - displays information gathered by controller
References instance variables set in the *controller*
**ERB**(Embedded Ruby) template
- allows injection of Ruby code into any kind of file
- preprocessed by server before being sent to the user

REST (Representational State Transfer)
---
A dominant *routing* paradigmn found througout the web, and also used heavily in Rails.
- Provides rules as to how requests are *routed* within the application itself

This is very important to follow in creating an application that can be refactored easily for future developers, as
well as making your API (Application Programming Interface) easily accessible to outside developers, so they can use
pieces of it inside *their* application.

Useful knowledge:
- [Best Practices for Designing a Pragmatic RESTful API](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api)
- [GET a cup of coffee](http://www.infoq.com/articles/webber-rest-workflow)

Core Components
====

Assets
---
Directory containing static assets or parts of the application for use by the view
- This contains things such as Javascript files, images, CSS, and other things to make the application sexy

Helpers
---
Directory for placing snippets of Ruby code (modules) that provide *helpers* for the *views*
- These are pieces of code/functionality sucked from a *view* file to provide cleaner code in the view

Mailers
---
Directory containing classes of the application dealing with sending mail! (you didn't see that coming, did ya?!)

Application Environments
------------------------
Rails provides three application environments: development/test/production
**Development**
- Classes are not *cached*; no need to restart server after changes to a class
**Production**
- Classes ARE cached; server restarts required for changes to take effect

Creating Components
====

Generate new application
------------------------
`rails new things_i_bought`

Starting the WEBrick server
----------------------------
`rails server` or `rails s`
- This uses the Ruby standard library webserver (WEBrick)

Open the server in your browser
- Nagivate to *localhost:3000* or *0.0.0.0:3000* or *127.0.0.1:3000*

Scream "CHOO CHOO" and thrust your fist into the air
- Apologize to the cat for interrupting her slumber

Scaffolding
-----------
**Scaffold** - generates model/controller/views/tests based on name passed

bin/rails generate scaffold [scaffold name] [field name]:[field type] [another fName]:[another fType]
- The fields after the scaffold name will become entried in the database, and *attributes* for the object
- This generates a *migration* that will be added into the database

**Migration** - provides a means of version control to the database
- This allowed incremental changes to be made to the schema of the database
`rake db:migrate`

**Files/Directories** - db/migrate/[date]name_of_migration.rb (ActiveRecord::Migration)
- This migration file can be edited pre-migration to include

Testing
====

Unit testing (and MiniTest) has the general idea that there are *test methods* that
make *assertions* about your code.  These *test methods* are used against *test fixtures* 
to determine if a certain functionality is working properly

**MiniTest** - TDD (Test Driven Development)

---
- Note: MiniTest class methods must have prefix of "test_methodNameHere" to ensure that the 
method properly inherits MiniTest class functions.


**RSpec** - BDD (Behavior Driven Development)

---

- Code is written with *specs* that contain *examples* of what functionality should and should'nt do.

*Running Tests*
`rspec spec/`
- This will run all the tests in the "spec" directory
`rspec spec/ --example Bacon`
- This matches the *describe block* title, so as to run a specific test in the suite.

