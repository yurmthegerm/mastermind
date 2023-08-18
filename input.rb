require_relative "narrative.rb"

module Input
    include Narrative
    
    def makes(code)
        result = code
        if not is_valid?(code)
            puts invalid
            result = gets.chomp
            makes(result)
        end
        return result
    end

    def trial(game)
        count = 12
        while count >= 0 do
            if count != 0
                if game.maker.name != 'You' 
                    puts answer_prompt(count)
                    answer = gets.chomp
                    if answer.to_i == game.code.to_i
                        puts correct(game.breaker.name)
                        break
                    else
                        puts wrong
                        count -= 1
                    end  
                else
                    puts "computer part coming soon~"
                    break
                end
            else
                puts game_over(game)
                puts again
                result = gets.chomp
                count -= 1
            end
        end
        return result
    end

    private

    def is_valid?(code)
        code.to_s.length == 4 && one_to_six?(code.to_s)
    end

    def one_to_six?(code)
        compare = ['1','2','3','4','5','6']
        result = true
        code.split('').each { |chr|
            if not compare.include?(chr)
                result = false
            end
        }
        return result
    end

end

