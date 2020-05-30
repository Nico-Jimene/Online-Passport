require_relative 'RecordDatabase.rb'
require_relative 'Passport.rb'
require_relative 'RecordBlockChain.rb'

class VerificationSystem

  attr_accessor :databases

  def initialize
    @databases = Array.new
  end

  def addDatabase(filepath)
    @databases << RecordDatabase.new(filepath)
  end

  def updatePassport(pass)
    for db in @databases
      db.updatePassport(pass)
    end
  end

  def addUseRecord(pass, location, date)
    pass.addUseRecord(location, date)
    updatePassport(pass)
  end

  def verifyPassport(pass)
    useRecords = pass.getUseRecords
    if !useRecords.isValidChain
      return false
    end
    for db in @databases
      if !db.checkPassport
        return false
      end
    end
    return true
  end

  def checkDatabaseIntegrity
    # TODO
    return true 
  end

end