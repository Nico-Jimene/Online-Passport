require_relative('RecordIO.rb')

class RecordDatabase

  attr_accessor :location

  def initialize(location)
    @location = location
  end

  def checkPassport(pass)
    passports = RecordIO.readPassportsFromFile(@location)
    for passport in passports
      if passport.equals(pass)
        return true
      end
    end
    return false
  end

  def updatePassport(pass)
    passports = RecordIO.readPassportsFromFile(@location)
    updatedPassports = Array.new
    
    for passport in passports
      if passport.getId!=pass.getId
        updatedPassports.push passport
      else 
        updatedPassports.push pass
      end
    end

    puts updatedPassports

    RecordIO.writePassportsToFile(@location, updatedPassports)
  end
  
end