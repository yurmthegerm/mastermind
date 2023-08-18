require_relative "narrative.rb"
require_relative "player.rb"
require_relative "computer.rb"
require_relative "input.rb"

class Game
    include Narrative
    include Input

    attr_accessor :code

    def initialize
        self.code = nil
    end

    def intro
        puts welcome
        puts mode
        result = gets.chomp.to_i
        if result == 1
            body(Computer.new)
        elsif result == 2
            body(Player.new)
        else
            puts invalid
            puts intro
        end
    end

    def body(maker)
        if maker.class == Computer
            self.code = maker.makes(maker.generate_code)
        else
            puts make_code
            result = gets.chomp
            self.code = maker.makes(result)
        end
    end
    
end
