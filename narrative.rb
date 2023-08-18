module Narrative

    def welcome
        "\nWelcome to Mastermind. \n\nWould you like to become a code-breaker or a code-maker?"
    end

    def mode
        "Type '1' to break or '2' to make: "
    end

    def invalid
        "\nInvalid input. Try again:"
    end

    def make_code
        "Enter a 4-digit code from 1-6: "
    end

    def body_intro
        "Now, let's try solving the code!"
    end

    def answer_prompt(count)
        "Guess the code. Good luck! (#{count} tries left): "
    end

    def wrong(yes, no)
        "Correct number, wrong location = #{no}. \nCorrect number, correct location = #{yes}."
    end

    def correct(who)
        if who == 'You'
            "#{who} have guessed the code correctly!"
        else
            "#{who} has guessed the code correctly!"
        end
    end

    def game_over(game)
        "Game over. The code was #{game.code}. Better luck next time!\n"
    end

    def again
        "Would you like to try again? (y/n)"
    end

    def bye
        "Good-bye."
    end

end