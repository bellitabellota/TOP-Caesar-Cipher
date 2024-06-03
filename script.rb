def encode_message(source_message, shift)
  alphabet_lower_case = ('a'..'z').to_a
  alphabet_upper_case = ('A'..'Z').to_a

  source_message.split("").reduce("") do |encoded_message, source_character|

    letter_index = nil
    encoded_alphabet_letter = ""

    if !alphabet_upper_case.any? { |uppercase_letter| source_character.upcase == uppercase_letter }
      encoded_message += source_character
    else
      if source_character != source_character.upcase
        alphabet = alphabet_lower_case
      elsif source_character == source_character.upcase
        alphabet = alphabet_upper_case
      end
      
      alphabet.each_with_index {|alphabet_letter, alphabet_letter_index|
        if alphabet_letter == source_character
            letter_index = alphabet_letter_index
        end
      }

      alphabet.each_with_index {|alphabet_letter, alphabet_letter_index|
        incremented_index = letter_index + shift

        if incremented_index > 25
          incremented_index -= 26
        end
          
        if alphabet_letter_index == incremented_index
          encoded_alphabet_letter = alphabet_letter
        end
      }
      
      encoded_message += encoded_alphabet_letter
    end
  end
end

p encode_message("What a string!", 5)