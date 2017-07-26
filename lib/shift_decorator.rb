# the concrete component we would like to decorate, a car in our example
class BasicShift
    def initialize(c, m, color)
        @cost = c
        @firm = m
        @color = color
        @description = "basic shift"
    end
    
    # getter method
    def cost 
        return @cost
    end
    
    # a method which returns a string representation of the object of type BasicShift
    def details
        return @description + "; " + @firm + "; " + @color + ": " + "#{@cost}"
    end
    
    # getter method
    def color
        return @color
    end
    
    # getter method
    def firm 
        return @firm
    end
    
end # ends the BasicShift class



# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class ShiftDecorator < BasicShift
    def initialize(basic_shift)
        #basic_shift is a real car, i.e. the component we want to decorate
        @basic_shift = basic_shift
        super(@basic_shift.cost, @basic_shift.firm, @basic_shift.color)
        @extra_cost = 0
        @description = "no extra feature"
    end
    
    # override the cost method to include the cost of the extra feature	
    def cost        
        return @extra_cost + @basic_shift.cost
    end
    
    # override the details method to include the description of the extra feature
    def details
        return  @description + ": " + "#{@extra_cost}" + ". " + @basic_shift.details
    end
    
end # ends the CarDecorator class


# a concrete decorator --  define an extra feature



# another concrete decorator -- define an extra feature
class ElectricWindowsDecorator < ShiftDecorator
    def initialize(basic_shift)
        super(basic_shift)
        @extra_cost = 40
        @description = "Xray"
    end
    
end # ends the ElectricWindowsDecorator class

class CtscanDecorator < ShiftDecorator
    def initialize(basic_shift)
        super(basic_shift)
        @extra_cost = 100
        @description = "CT scan"
    end
    
end # ends the ElectricWindowsDecorator class


class EndoscopyDecorator < ShiftDecorator
    def initialize(basic_shift)
        super(basic_shift)
        @extra_cost = 150
        @description = "endoscopy"
    end
    
end # ends the ElectricWindowsDecorator class

class CardDecorator < ShiftDecorator
    def initialize(basic_shift)
        super(basic_shift)
        @extra_cost = -10
        @description = "card"
    end
    
end # ends the ElectricWindowsDecorator clas