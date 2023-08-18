require_relative "narrative.rb"
require_relative "player.rb"
require_relative "computer.rb"
require_relative "input.rb"

class Game
    include Narrative
    include Input

    attr_accessor :code, :maker, :breaker

    def initialize
        self.code = nil
        self.maker = nil
        self.breaker = nil
    end

    def start
        response = 'y'
        while response == 'y'
            intro
            response = gaming
        end
        puts bye
    end

    def intro
        puts welcome
        puts mode
        result = gets.chomp.to_i
        if result == 1
            self.maker = Computer.new
            self.breaker = Player.new
            code_into_game(self.maker)
        elsif result == 2
            self.maker = Player.new
            self.breaker = Computer.new
            code_into_game(self.maker)
        else
            puts invalid
            puts intro
        end
    end

    def gaming
        again_response = trial(self)
        return again_response
    end

    def code_into_game(maker)
        if maker.class == Computer
            self.code = maker.makes(maker.generate_code)
        else
            puts make_code
            result = gets.chomp
            self.code = maker.makes(result)
        end
    end

    
end
