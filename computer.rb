require_relative "input.rb"

class Computer
    include Input

    def generate_code
        code = String.new("")
        4.times { 
            num = rand(1..6).to_s
            code.concat(num)
        }
        return code
    end
    
end