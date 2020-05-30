class RecordIO

  def self.readPassportsFromFile(filepath)
    passports = Array.new
    size = 0

    file = File.read(filepath)
    file = file.split("\n")

    for line in file
      if line[0]=='*'
        line = line.split("-")
        passports[size] = Passport.new(line[0][1..-1], line[1], line[2], line[3], line[4])
        size += 1
      else
        line = line.strip
        line = line.split("-")
        passports[size - 1].addUseRecord(line[0], line[1])
      end
    end

    return passports
  end

  def self.writePassportsToFile(filepath, passports)
    file = File.open(filepath, "w")
    outString = ""
    for passport in passports
      outString += "\n" + passport.toString
    end
    outString = outString.strip
    file.print outString
  end

end