class Employee
  attr_accessor :salary
  def initialize(name,title,salary,boss=nil)
    @name=name
    @title=title
    @salary=salary
    @boss=boss
    @boss.assign_employee(self) unless boss.nil?
  end


   def assign_boss
     @boss.assign_employee(self)
   end

  def bonus(multi = nil)
    return @salary if multi == nil
    @salary*multi
  end


end


class Manager < Employee
  attr_accessor :employees
  def initialize(*arg)
    @employees=[]
    super
  end

def assign_employee(input)

  @employees << input
end

def bonus(multi = nil)
  employee_base=(@employees.inject(0){|acc,emp|  acc+  emp.bonus + ( emp.class==Manager ? emp.salary : 0  )   })
  multi == nil ? employee_base : employee_base * multi
end


end



ned=Manager.new("Ned","Founder",1000000)
darren=Manager.new("Darren","no one cares",78000,ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p david.bonus(3)
p ned.bonus(5)
p darren.bonus(4)
