#testing scripts
require_relative 'Passport.rb'
require_relative 'RecordDatabase.rb'

require 'sinatra'

set :protection, :except => :frame_options
set :bind, '0.0.0.0'

get '/' do
  erb :index, :locals => { host: request.host }
end

testPass = Passport.new("asreedh", "Aneesh", "N/A", "Sreedhara", "02/13/2003")

puts testPass.getId
puts testPass.getFirstName
puts testPass.getMiddleName
puts testPass.getLastName
puts testPass.getDateOfBirth

testPass.addUseRecord("Geneva", "01/01/2020")
testPass.addUseRecord("Jakarta", "01/01/2020")

useRecords = testPass.getUseRecords
blockArray = useRecords.blocks

puts blockArray[1].getLocation
puts blockArray[1].getDate
puts blockArray[2].getLocation
puts blockArray[2].getDate
puts useRecords.isValidChain

blockArray[1].location = "totally not Geneva lol"
puts useRecords.isValidChain

blockArray[1].location = "Geneva"
puts useRecords.isValidChain
puts testPass.toString

db = RecordDatabase.new("test-files/test_records.txt")
puts db.checkPassport(testPass)

testPass2 = Passport.new("kpeters4", "Karl", "N/A", "Peterson", "01/01/2002")
puts db.checkPassport(testPass2)

db.updatePassport(testPass2)
