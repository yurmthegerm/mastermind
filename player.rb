require_relative "input.rb"

class Player
    include Input

    attr_reader :name

    def initialize
        @name = 'You'
    end


end