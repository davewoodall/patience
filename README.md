# Card
As a user I would like to be able use my medical recommendation and id for multiple orders. I would also like to be able to replace or delete my id and medical recommendation.

# Discussion
Create a service for a dispensary, that stores users, medical recommendations and IDs.

The Users service should allow a user to upload a State ID and medical recommendation metadata. The user should be able to update or delete the ID or Rec.

Store users name, email, and dob

Store the medical recommendation number, issuer, state, expiration date and path to the image.

Store the State ID number, state, expiration date and path to the image.

Store images in a local directory. (Bonus)

If the id or recommendation is expired return expired.

# Notes 
Use you normal git workflow except on the initial commit add an estimate of how long it will take to complete the exercise. 

For example git commit -m "Initial commit 3 hours" 

# Confirmation
API endpoint that returns a User, medical recommendation, and id.

If the id or recommendation are expired return expired.

Ability to delete or update rec and id.

Create a dev branch and a pull request to master

![Sample Rec](image2.gif)

# Bonus
Image uploads is a stretch goal

Deploy the application

Create a frontend
