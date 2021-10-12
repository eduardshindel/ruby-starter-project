class TemperatureFrom
    def self.from
        puts "Please enter from which scale do you want to translate (F, K, C)?"
        from = gets.chomp
    end

    def self.is_correct? suspect
        if suspect == "F" or suspect == "K" or suspect == "C" then true
        else false end
    end
end