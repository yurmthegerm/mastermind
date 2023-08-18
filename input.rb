require_relative "narrative.rb"

module Input
    include Narrative
    
    def makes(code)
        if not is_valid?(code)
            puts invalid
            makes(gets.chomp)
        end
        return code
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

