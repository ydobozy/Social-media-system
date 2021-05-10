# project-ydobozy Social media system

University project. Creation of social chat with Linux tackling the 2 issues:
- Validating user's entries
- Solving concurrency issues with messaging 

The system has a client-server architecture, and let users (clients) exchange public messages on their \wall" with
friends.

The server stores information about the different users, their wall, and who they are friends
with. Each user, named $user, is represented by a folder $user. Example values for $user are
anthony or Dr A.. Each user directory contains two files:
• wall, containing message posted by friends to the user's wall. Each line contains one
message and has the following structure: friend id : message
• friends, containing the id of the user's friends, one id per line. Only friends can post to
a user's wall. Note that the friend relationship is not symmetric in our system: A can be
a friend of B (A can write to B's wall) while B is not a friend of A (B can not write to
A's wall).


# Basic Commands of the Server
• Create new user: Create a new folder and files to store a user's information.
• Add new friend: Add a user to another user's friend list.
• Post a message: Add a message from one user to another user's wall.
• Show wall: Display the contents of a wall.

# Set up
Clone project and execute basic commands.
$ git clone git https://github.com/COMP30640/project-ydobozy.git
