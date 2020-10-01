##CLI file for storing CLI classes and method
require_relative '../env.rb'
class Welcome
    ##Print Welcome message to screen
    
    @@font = TTY::Font.new(:doom)
    @@pastel = Pastel.new

    def self.welcome_msg
    ChoreAnimation.animation
    end

    def self.register_or_login
        prompt = TTY::Prompt.new
        foo = prompt.select("Register or Login", [
            "Register",
            "Login"
        ])
        case foo
        when "Register"
            Registration.info
            Registration.newUser
        when "Login"
            LogIn.info
        end
    end
end




class Registration
    def self.info
        puts "Please enter your full name"
        @@name = gets.chomp 
        puts "Please enter your cell phone number"
        @@phone = gets.chomp
        puts "Please create a password"
        @@password = gets.chomp
    end

    def self.newUser 
        user = User.create(name: @@name, phone_number: @@phone, password: @@password)
        system("clear")
        puts "Welcome #{user.name}!"
        MainMenu.menu
    end
end



class LogIn
    def self.info
        
        puts "What is your name?"
        name = gets.chomp
        puts "Please enter your password"
        password = STDIN.noecho(&:gets).chomp

        User.all.map do |user|
            if user.name == name && user.password == password
                system("clear")
                puts "Welcome #{user.name}!"
                MainMenu.menu
            end
        end
    end
end

class MainMenu 
    def self.menu
        prompt = TTY::Prompt.new
        @@input = prompt.select("What would you like to do?", [
        'Add Roommate',
        'Delete Roommate',
        'Add Chore',
        'Delete Chore',
        'View Roommates',
        'View Chores',
        'Randomize Chores',
        'View Chore Assignments',
        'Mark Chore Complete',
        'Switch Chores',
        'Send Reminders',
        'Exit'
        ])
        self.menu_choice
    
    end

    def self.menu_choice
        case @@input
        when "Add Roommate"
            MainMenu.add_roommate
        when "View Roommates"
            MainMenu.view_roommates
        when "Delete Roommate"
            MainMenu.delete_roommate
        when "Add Chore"
            MainMenu.add_chore
        when "View Chores"
            MainMenu.view_chores
        when "Delete Chore"
            MainMenu.delete_chore
        when "View Chore Assignments"
            MainMenu.view_chore_assignments
        when "Mark Chore Complete"
            MainMenu.mark_complete
        when "Randomize Chores"
            MainMenu.randomize_chores
        when "Switch Chores"
            MainMenu.switch_chores
        when "Exit"
            MainMenu.exit
        when "Send Reminders"
            MainMenu.send_reminders
        end
    end

    def self.exit
        system("clear")
        puts "Goodbye!"
        system("exit")
    end

    def self.return_to_main
        sleep(3.0)
        system("clear")
        MainMenu.menu
    end

    def self.view_chore_assignments
        ChoreAssign.construct_display
        prompt = TTY::Prompt.new
        exitt = prompt.select("", [
        "Exit"])
        case exitt
        when "Exit"
            system('clear')
            MainMenu.menu
        end
    end

    def self.mark_complete
        prompt = TTY::Prompt.new
        roommate = prompt.select("Pick A Roommate:", User.names)
        User.all.each do |user|
            if roommate == user.name
                system('clear')
                chore_prompt = TTY::Prompt.new
                chore_prompt = prompt.select("Chose Chore To Mark Complete", user.chores.names)
                Chore.all.each do |chore|
                    if chore_prompt == chore.name
                        system('clear')
                        chore.status = true
                        chore.save
                        puts "Chore Is Now Marked Complete"
                        sleep 2.0
                        MainMenu.menu
                    end
                end
            end
        end
    end

    def self.add_roommate
        puts "What is your roommate's full name?"
        name = gets.chomp
        puts "What is your roommate's phone number?"
        phone = gets.chomp
        User.create(name: name, phone_number: phone)
        puts "Success! Roommate added".colorize(:green)
        self.return_to_main
    end

    def self.delete_roommate
        puts "What is your roommate's full name?"
        name = gets.chomp
        User.all.each do |user|
            if name == user.name
                User.all.delete(user)
                puts "Roommate has been deleted!".colorize(:red)
                sleep 3.0
                system('clear')
                MainMenu.menu
            end
        end
        puts 'Roommate Not Found'.colorize(:red)
        self.return_to_main
    end

    def self.view_roommates
        puts "These are your roommates:"
        puts "\n"
        puts User.names
        prompt = TTY::Prompt.new
        exit = prompt.select("",['exit'])
        if exit == 'exit'
            system('clear')
            MainMenu.menu
        end
    end

    def self.add_chore
        puts "Please type in a short description of the chore you would like to add:"
        chore_name = gets.chomp
        Chore.create(name:chore_name)
        puts "Success! Chore added".colorize(:green)
        sleep 3.0
        system('clear')
        MainMenu.menu
    end

    def self.view_chores
        puts "These are all the chores"
        puts "\n"
        puts Chore.names
        prompt = TTY::Prompt.new
        exit = prompt.select("",['exit'])
        if exit == 'exit'
            system('clear')
            MainMenu.menu
        end
    end

    def self.delete_chore
        puts "What chore would you like to remove"
        chore_name = gets.chomp
        Chore.all.each do |chore|
            if chore_name == chore.name
                Chore.all.delete(chore)
                puts "Chore has been removed!".colorize(:red)
                self.return_to_main
            end
        end
        puts 'Chore Not Found'.colorize(:red)
        self.return_to_main
    end

    def self.randomize_chores
        puts "Randomizing Chores!!!"
        ChoreAssign.randomize
        sleep 2.0
        puts "Chores Assigned!".colorize(:green)
        MainMenu.view_chore_assignments
    end

    def self.switch_chores
        prompt = TTY::Prompt.new
        first_name = prompt.select("Select the First Person For the Switch", User.names)
        system('clear')
        prompt_2 = TTY::Prompt.new
        second_name = prompt_2.select("Select the Second Person For the Switch", User.names)
        system('clear')
        if first_name == second_name
            puts "Sorry, you chose the same person twice!".colorize(:red)
            self.return_to_main
        end
        user_1 = User.all.select {|user| user.name == first_name}
        user_2 = User.all.select {|user| user.name == second_name}

        user_1[0].switch(user_2[0])
        puts "Chores are now switched!!!".colorize(:green)
        self.return_to_main
    end

    def self.send_reminders
        prompt = TTY::Prompt.new
        roommate = prompt.select("Who would you like to send a reminder", User.names)
        SendTxtMessage.message(User.find_by(name: roommate))
        puts "Reminder has been sent!"
        sleep 2.0
        self.return_to_main
        
    end
end

class ChoreAnimation

        @@iteration_1 = " ██████╗██╗  ██╗ ██████╗ ██████╗ ███████╗    ██████╗  ██████╗ ████████╗".colorize(:light_blue)
        @@iteration_2 = "██╔════╝██║  ██║██╔═══██╗██╔══██╗██╔════╝    ██╔══██╗██╔═══██╗╚══██╔══╝".colorize(:light_blue)
        @@iteration_3 = "██║     ███████║██║   ██║██████╔╝█████╗      ██████╔╝██║   ██║   ██║   ".colorize(:light_blue)
        @@iteration_4 = "██║     ██╔══██║██║   ██║██╔══██╗██╔══╝      ██╔══██╗██║   ██║   ██║   ".colorize(:light_blue)
        @@iteration_5 = "╚██████╗██║  ██║╚██████╔╝██║  ██║███████╗    ██████╔╝╚██████╔╝   ██║   ".colorize(:light_blue)
        @@iteration_6 = " ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝    ╚═════╝  ╚═════╝    ╚═╝   ".colorize(:light_blue)
        @@iteration_7 = "            Welcome to Chore Bot, The digital chore wheel!             ".colorize(:light_blue)

    def self.animation 
        puts @@iteration_1
        sleep 0.25
        puts @@iteration_2
        sleep 0.25
        puts @@iteration_3
        sleep 0.25
        puts @@iteration_4
        sleep 0.25
        puts @@iteration_5
        sleep 0.25
        puts @@iteration_6
        sleep 0.25
        puts @@iteration_7
        sleep 0.25
    end
end

class SendTxtMessage
    def self.message(user)
        chore_list = user.chores.map {|chore|chore.name}.join(', ')
        phone_num = "+1"+user.phone_number
        client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)

        from = '+12056795263' # Your Twilio number
        to = phone_num
        #'+12069148755' # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "-
        
        
        Hello #{user.name}!

This is a friendly reminder from ChoreBot! 
These are your current chore assignments:
        #{chore_list}.

Please complete your chores by the end of the week!

Thank You!"
        )
    end
end
