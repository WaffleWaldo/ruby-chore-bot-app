##CLI file for storing CLI classes and methods



class Welcome
    ##Print Welcome message to screen
    def self.welcome_msg
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
            puts "Not a valid response"
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
                puts "Welcome #{user.name}, how can I help you?"
            end
        end
    end
end


class MainMenu
end
