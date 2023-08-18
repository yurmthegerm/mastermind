require_relative "narrative.rb"
require_relative "player.rb"
require_relative "computer.rb"
require_relative "input.rb"

class Game
    include Narrative
    include Input

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
            puts maker.generate_code
        else
            puts make_code
            result = gets.chomp
            maker.makes(result)
        end
    end
end
