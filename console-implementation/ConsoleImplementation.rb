require_relative '../model/VerificationSystem.rb'
require_relative '../model/RecordIO.rb'

class ConsoleImplementation

  attr_accessor :verificationSystem 

  def initialize
    @verificationSystem = VerificationSystem.new
    runProgram
  end

  def runProgram
    
    puts "--------------------------"
    puts "Passport System Started..."
    puts "--------------------------"

    puts "Please enter the name of \n your passport file:"
    filepath = "/home/runner/Online-Passport/console-implementation/passport_files/" + gets.chomp
    puts "Thank you..."

    passport = RecordIO.readPassportsFromFile(filepath)[0]

    puts "--------------------------"

    puts "Would you like to... \n(V)erify this passport \n(A)dd a new use record"

    action = gets.chomp
    puts "--------------------------"

    if action=="V"
      puts "Thank you..."
      puts "We have conducted a test to verify your passport file"
      puts "--------------------------"
      puts ("Verified: " + @verificationSystem.verifyPassport(passport).to_s)
      puts "--------------------------"
    elsif action=="A"
      puts "Thank you..."
      puts "Please enter the country of use"
      location = gets.chomp
      puts "Please enter the date of use"
      date = gets.chomp
      
      @verificationSystem.addUseRecord(passport, location, date)
      passArr = []
      passArr << passport
      RecordIO.writePassportsToFile(filepath, passArr)
      puts "--------------------------"
      puts "Thank you. This record has been saved"
      puts "--------------------------"
    end
    puts "Program ending..."
    puts "--------------------------"

  end

end