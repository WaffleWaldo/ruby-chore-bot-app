##CLI file for storing CLI classes and methods



class Welcome
    ##Print Welcome message to screen
    def self.welcome_msg
        puts "Welcome to ChoreBot!"
        puts "The digital chore wheel"
    end
end

class Registration
    
    def name 
        gets "Please enter your full name"
    end

    def email
        gets "Please enter your email address"
    end

    def password 
        gets "Please create a password"
    end



end

class LogIn
end


class MainMenu
end
