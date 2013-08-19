meap
====

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
*Model* - application domain logic
- this includes database record retreival, validation and manipulation.

*Controller* - median between model (databases) and view
- call methods on model classes which return objects
- returned objects
> represent rows in the database
> can be single objects or collections of them
> made available to the *view* through *instance variables* 
- perform permission checking
> ensures special permission functions (i.e. admin functions) are limited to that user

*View* - displays information gathered by controller
- references instance variables set in the *controller*
- *ERB*(Embedded Ruby) template
> allows injection of Ruby code into any kind of file
> preprocessed by server before being sent to the user

REST (Representational State Transfer)
---
A dominant *routing* paradigmn found througout the web, and also used heavily in Rails.
- Provides rules as to how requests are *routed* within the application itself
This is very important to follow in creating an application that can be refactored easily for future developers, as
well as making your API (Application Programming Interface) easily accessible to outside developers, so they can embed
your framework (or pieces of it) inside *their* application.

Useful knowledge:
[Best Practices for Designing a Pragmatic RESTful API](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api)
[GET a cup of coffee](http://www.infoq.com/articles/webber-rest-workflow)

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
