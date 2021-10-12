class TemperatureTo    
    def self.to
        puts "Please enter which scale do you want to convert (F, K, C)?"
        to = gets.chomp
    end

    def self.is_correct? from, suspect
        if suspect == "F" or suspect == "K" or suspect == "C" 
            if from != suspect then true
            else false end
        else false end
    end
end