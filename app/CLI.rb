##CLI file for storing CLI classes and method
class Welcome
    ##Print Welcome message to screen
    
    @@font = TTY::Font.new(:doom)
    @@pastel = Pastel.new

    def self.welcome_msg
        puts "
        ██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗    ████████╗ ██████╗      ██████╗██╗  ██╗ ██████╗ ██████╗ ███████╗    ██████╗  ██████╗ ████████╗██╗
        ██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝    ╚══██╔══╝██╔═══██╗    ██╔════╝██║  ██║██╔═══██╗██╔══██╗██╔════╝    ██╔══██╗██╔═══██╗╚══██╔══╝██║
        ██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗         ██║   ██║   ██║    ██║     ███████║██║   ██║██████╔╝█████╗      ██████╔╝██║   ██║   ██║   ██║
        ██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝         ██║   ██║   ██║    ██║     ██╔══██║██║   ██║██╔══██╗██╔══╝      ██╔══██╗██║   ██║   ██║   ╚═╝
        ╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗       ██║   ╚██████╔╝    ╚██████╗██║  ██║╚██████╔╝██║  ██║███████╗    ██████╔╝╚██████╔╝   ██║   ██╗
         ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝       ╚═╝    ╚═════╝      ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝    ╚═════╝  ╚═════╝    ╚═╝   ╚═╝
                                                                           The digital chore wheel                                                                                           
     ".colorize(:light_blue)
        # puts "The digital chore wheel"

        # puts @@pastel.cyan(@@font.write("ChoreBot"))
        puts "Welcome to ChoreBot!"
        puts "The digital chore wheel"
    end

    def self.register_or_login
        puts "Register or Login?"
        puts "Please type in your response."
        answer = gets.chomp.downcase
        if answer == "register"
            Registration.info
            Registration.newUser
        elsif answer == "login"
            LogIn.info
        else
            system("clear")
            puts "Not a valid response"
            puts ""
            self.register_or_login

        end
    end
end

class Registration
    def self.info
        puts "Please enter your full name"
        @@name = gets.chomp 
        puts "Please enter your email address"
        @@email = gets.chomp
        puts "Please create a password"
        @@password = gets.chomp
    end

    def self.newUser 
        user = User.create(name: @@name, email_address: @@email, password: @@password)
        system("clear")
        puts "Welcome #{user.name}!"
        MainMenu.menu
    end
end

class LogIn
    def self.info
        
        puts "What is your email address?"
        email = gets.chomp
        puts "Please enter your password"
        password = gets.chomp

        User.all.map do |user|
            if user.email_address == email && user.password == password
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
        'View Chore Assignments',
        'Mark Chore Complete',
        'Randomize Chores',
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
        when "View Chore Assignments"
            MainMenu.view_chore_assignments
        end
    end

    def self.exit
        system("clear")
        puts "Goodbye!"
        sleep(1.0)
        exit
    end

    def self.return_to_main
        prompt = TTY::Prompt.new
        if prompt.yes?("Return to main menu?") == true
            sleep(0.75)
            system("clear")
            MainMenu.menu
        else
            self.exit
        end
    end

    def self.view_chore_assignments
        ChoreAssign.construct_display
        self.return_to_main
    end

    def self.mark_complete
    end

    def self.add_roommate
        puts "What is your roommate's full name?"
        name = gets.chomp
        puts "What is your roommate's email address?"
        email = gets.chomp
        User.create(name:name,email_address:email)
        puts "Success! Roommate added"
        self.return_to_main
    end

    def self.delete_roommate
        puts "What is your roommate's full name?"
        name = gets.chomp

    end

    def self.view_roommates
    
    end

    def self.add_chore
        puts "Please type in a short description of
                of the chore you would like to add:"
        chore_name = gets.chomp
        Chore.create(name:chore_name)
        puts "Success! Chore added"
    end

    def self.delete_chore
    end

    def self.randomize_chores
    end

    def self.switch_chores
    end

    def self.send_reminders
        mail = Mail.new do
            from    'ChoreBot'
            to      'j.watsonreid@gmail.com'
            subject 'This is a test email'
            body    "Hello! This is a friendly reminder from ChoreBot to 
                    please complete your chores by the end of the week! 
                    
                    Thank you!"
        end
        mail.delivery_method :sendmail
        mail.deliver
    end
end
