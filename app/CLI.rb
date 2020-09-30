##CLI file for storing CLI classes and methods



class Welcome
    ##Print Welcome message to screen
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
end


class MainMenu
    puts
end
