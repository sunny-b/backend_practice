module Delegateable
  def delegate
    'I can delegate work!'
  end
end

class Employee
  def initialize(name, serial_num)
    @name = name
    @serial_num = serial_num
    @employment_status = 'Full time'
  end
end

class Executive < Employee
  include Delegateable

  def initialize(name, serial_num)
    super("Exe " + name, serial_num)
    @vacation_days = 20
    @work_station = 'Corner Office'
  end
end

class Manager < Employee
  include Delegateable

  def initialize(name, serial_num)
    super("Mgr " + name, serial_num)
    @vacation_days = 14
    @work_station = 'Regular Private Office'
  end
end

class Regular < Employee
  def initialize(name, serial_num)
    super
    @vacation_days = 10
    @work_station = 'Cubicle'
  end
end

class PartTime < Employee
  def initialize(name, serial_num)
    super
    @employment_status = 'Part time'
    @vacation_days = 0
    @work_station = 'Open Workspace'
  end
end
