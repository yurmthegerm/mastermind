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
                        hint = feedback(answer, game.code)
                        puts wrong(hint[0], hint[1])
                        count -= 1
                    end  
                else
                    puts "computer part coming soon~"
                    break
                end
            else
                puts game_over(game)
            end
        end
        puts again
        result = gets.chomp
        return result
    end

    private

    def feedback(answer, code)

        answer_list = answer.to_s.split('')
        code_list = code.to_s.split('')

        yes_location = 0
        no_location = 0

        answer_list.each_with_index do |i, i_ind|
            code_list.each_with_index do |j, j_ind|
                if i != '0' || j != '0'
                    if i == j && i_ind == j_ind
                        yes_location += 1
                        answer_list[i_ind] = '0'
                        code_list[j_ind] = '0'
                        puts "lists after yes = \n#{answer_list}\n#{code_list}\n"
                    end
                end
            end
        end

        answer_list.each_with_index do |i, i_ind|
            code_list.each_with_index do |j, j_ind|
                if i != '0' || j != '0'
                    if i == j && i_ind != j_ind
                        no_location += 1
                        answer_list[i_ind] = '0'
                        code_list[j_ind] = '0'
                        puts "lists after no = \n#{answer_list}\n#{code_list}\n"
                    end
                end
            end
        end


        return [yes_location, no_location]
    end


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

