# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
      User and Conference
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - yes, User has_many conferences
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - yes, conferences belongs_to User
- [x] Include user accounts with unique login attribute (username or email)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - User has full CRUD capabilities
- [x] Ensure that users can't modify content created by other users
    added protection to edit/delete links to make sure a user can't edit or delete a conference
- [x] Include user input validations
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    - in progress...

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
