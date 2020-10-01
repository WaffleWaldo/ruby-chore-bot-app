# Chore Bot

Chorebot is a ruby-based CLI program that manages chores for a single household. With Chorebot you are able to add users/roommates and chores and assign them randomly to each person. You can then add and delete roommates and chores as time goes on. Update chore status to mark a chore complete. A great feature of Chorebot is the switch command. With this command you are able to switch chores with another, but of course both users have to agree on this. 

Use this program to end the typical arguing on who is going to do that most hated chore, let Chorebot decide for you!

<p align="center">
  <img width="270" height="250" src=img/robot.png>
</p>
<p align="center">
Icon made by <a href="http://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
</p>



## Installation

Clone the github repo that this README is in and open up the project directory. Use the Run.rb file in your terminal in order to start your instance of the program.

```bash
ruby bin/run.rb
```

If you want to play around with some of the code you can run a simple rake command.

```bash
rake console
```

Before running any of these commands make sure that you are in the main directory of the program "ruby-chore-bot-app/".

## Usage

With ChoreBot, managing chore assignment for your house is made easy with our handy dropdown menu. The functionality of each menu item is described below:

--Add/Delete Roommates
    -After registering or logging in to the app, toggle through the menu items to and select 'Add Roommate'. This option will prompt you to type in the name and email address of your roommate, and add them to the local database. 
    
    -If a roommate leaves the house, you can update your roommate list by typing in their name under the 'Delete Roommate' menu option.
    
--Add/Delete Chores
    -Chores can be created and deleted in a similar fashion to the roommates. Toggle through the menu options, type in the name of the chore, and update your chore list.

--View Roommates/Chores
    -Your current list of roommates and chores can be displayed using the 'View Roommate' or 'View Chores' option
    
--Randomize Chores
    -The 'Randomize Chores' menu option will randomly assign your chores to your list of roommates. Our randomization method has some built-in functionality to ensure that no single person is randomly assigned an unfair number of chores. Additionally, if there are more chores than roommates, or vice versa, the randomization method is designed to fairly divide up the chores as evenly as possible.

--View Chore Assignments
    -Select the 'View Chore Assignments' option to view the everyone's assignment for the week, and also view whether or not the chore has been completed. 

--Mark Chore Completed
    -Select the 'Mark Chore Completed' option to update the status of a particular chore and mark it complete.

--Switch Chores
    -In the event that you are not happy with one or two of the assignments, you can edit them with the 'Switch Chores' option. Type in the two names of the roommates whose chores you would like to switch, and the chore assignments will be updated.

--Exit
    -Exits the application
 

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Sources
--GEMS
    -Sinatra
    -SqLite3
    -Pry
    -RequireALL
    -TTY Toolkit
    -IO Console
    -Twilio

    
## License

[FlatIron School License](http://learn.co/content-license)