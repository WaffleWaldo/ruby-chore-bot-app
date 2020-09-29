##CLI file for storing CLI classes and methods



class Welcome
    ##Print Welcome message to screen
    
    @@font = TTY::Font.new(:doom)
    @@pastel = Pastel.new

    def self.welcome_msg

        puts @@pastel.cyan(@@font.write("ChoreBot"))
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
        User.create(name: @@name, email_address: @@email, password: @@password)
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
        choice = prompt.select("What would you like to do?", [
            'Add Roommate',
            'Delete Roommate',
            'Add Chore',
            'Delete Chore',
            'View Chore Assignments',
            'Mark Chore Complete',
            'Randomize Chores',
            'Switch Chores',
            'Send Reminders'
        ])
    end

    def self.view_chore_assignments
    end

    def self.mark_complete
    end

    def self.add_roommate
    end

    def self.delete_roommate
    end

    def self.add_chore
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
