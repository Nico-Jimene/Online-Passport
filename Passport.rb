require_relative 'RecordBlockChain.rb'

class Passport

  attr_accessor :id, :firstName, :middleName, :lastName, :dateOfBirth, :useRecords

  def initialize(id, first, middle, last, dob)
    @id = id
    @firstName = first
    @middleName = middle
    @lastName = last
    @dateOfBirth = dob
    @useRecords = RecordBlockChain.new
  end

  def getId
    return @id
  end

  def getFirstName
    return @firstName
  end

  def getMiddleName
    return @middleName
  end

  def getLastName
    return @lastName
  end

  def getDateOfBirth
    return @dateOfBirth
  end

  def getUseRecords
    return @useRecords
  end

  def addUseRecord(location, date)
    @useRecords.addBlock(location, date)
  end

  def toString
    retString = "Holder:" + @id + "-" + @firstName + "-" + @middleName + "-" + @lastName + "-" + @dateOfBirth + "\n"
    retString += @useRecords.toString 
    return retString
  end

end