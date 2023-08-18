require_relative "input.rb"

class Computer
    include Input

    attr_reader :name

    def initialize
        @name = 'The Computer'
    end

    def generate_code
        code = String.new("")
        4.times { 
            num = rand(1..6).to_s
            code.concat(num)
        }
        return code
    end
    
end