# Program Name:         Calculator.rb
# Programmer:           Joseph Choby
# Date Created:         2/20/2022
# Last Edited:          2/20/2022
#------------------------------------------------------------------------------------------------------------------------------
# Description: A basic Ruby project that allows users to enter two numbers and an operator from a choice of operators. Based on 
# the decision of the operator, the proper mathematical function will be run and the result returned to the user. Once this is 
# done executing, the user will be asked if they wish to continue using the calculator or not.

# Preconditions: The user sent input for their operator decision.
# Postconditions: Return true or false depending on whether the user entered a correct operator.
def CheckOperator(operator)
    
    if operator == "+"
        puts "You chose the + operator"
        return true
    elsif operator == "-"
        puts "You chose the - operator"
        return true
    elsif operator == "*"
        puts "You chose the * operator"
        return true
    elsif operator == "/"
        puts "You chose the / operator"
        return true
    else
        puts "Not a valid operator! Choose +, -, *, /"
        return false
    end #End of if statement

    return false
end #End of CheckOperator function

# Preconditions: The user sent input to tell if they want to continue or not.
# Postconditions: Returns true if the user wants to continue and false if they do not.
def CheckUserContinue(userInput)
    userInput = userInput.upcase

    if userInput == "Y"
        return true
    elsif userInput == "N"
        return false
    else 
        return false
    end #End of if statement

    return false
end #End of CheckUserContinue

# Preconditions: The user selected '+' as their operator and also entered two digits.
# Postconditions: Computes the result of adding both digits.
def Addition(digit1, digit2)
    return digit1 + digit2
end #End of Addition function

# Preconditions: The user selected '-' as their operator and also entered two digits.
# Postconditions: Computes the result of subtracting both digits.
def Subtraction(digit1, digit2)
    return digit1 - digit2
end #End of Subtraction function

# Preconditions: The user selected '*' as their operator and also entered two digits.
# Postconditions: Computes the result of multiplying both digits.
def Multiplication(digit1, digit2)
    return digit1 * digit2
end #End of Multiplication function

# Preconditions: The user selected '/' as their operator and also entered two digits.
# Postconditions: Computes the result of Dividing both digits. Will output error if there is divide by 0 error.
def Division(digit1, digit2)

    if digit2 == 0
        puts "Cannot divide by 0! Divide by 0 error."
        return "Err"
    end #End of if statement

end #End of Division Function

puts "Welcome to my Ruby Calculator!\n"

# Handles user input for operator.
isValidOperator = false
# Handles loop if user wants to continue or not.
userWantsToContinue = true
userInput = "Y"
# Handles user input if the want to continue.
checkUserInput = false

# As long as the user wants to continue, the calculator runs. Once user inputs 'N' to quit,
# the calculator will stop and program will end.
while userWantsToContinue == true

    puts "Enter a digit: "
    digit1 = gets.chomp.to_i
    puts "Your number is " + digit1.to_s
    puts "Enter another digit: "
    digit2 = gets.chomp.to_i
    puts "Your second digit is: " + digit2.to_s

    # If the operator is not valid, isValidOperator will be false
    # and will loop until we get valid operator input.
    while isValidOperator != true
        puts "Enter a sign to use (+, -, *, /): "
        operator = gets.chomp
        isValidOperator = CheckOperator(operator)
    end # End of while checking if operator is valid.

    isValidOperator = false

    # Perform our operation.
    case operator
    when "+"
        result = Addition(digit1, digit2)
    when "-"
        result = Subtraction(digit1, digit2)
    when "*"
        result = Multiplication(digit1, digit2)
    when "/"
        result = Division(digit1, digit2)
    else
       puts "Error in switch statement!"
    end # End of switch statement.

    puts digit1.to_s + " " + operator + " " + digit2.to_s + " = " + result.to_s

    # Checks to see if user input is valid. If user does want to continue,
    # checkUserInput is true and we go back to the top of the while loop.
    # If checkUserInput is false, the user entered bad input and will reprompt
    # for input.
    puts "Would you like to continue? Y/N"
    userInput = gets.chomp
    checkUserInput = CheckUserContinue(userInput)
    while checkUserInput == false

        # Ends loop if N is selected. User does not want to continue.
        if userInput.upcase == "N"
            userWantsToContinue = false
            break
        end #End of if statement

        puts "Invalid input!"
        puts "Would you like to continue? Y/N"
        userInput = gets.chomp
        checkUserInput = CheckUserContinue(userInput)
    end # End of while checking user input for continuing.

end # End of while checking to see if user wants to continue or end.

puts "Thank you for using the Ruby calculator!"