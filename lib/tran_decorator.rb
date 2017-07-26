# the concrete component we would like to decorate, a car in our example
class BasicTran
    def initialize(c, m, age)
        @cost = c
        @firm = m
        @age = age
        @description = "basic transfer"
    end
    
    # getter method
    def cost 
        return @cost
    end
    
    # a method which returns a string representation of the object of type BasicTran
    def details
        return  @description + ": " + "#{@extra_cost}" + ". " + @basic_cycle.details
    end
    
    # getter method
    def age
        return @age
    end
    
    # getter method
    def firm 
        return @firm
    end
    
end # ends the BasicTran class



# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class TranDecorator < BasicTran
    def initialize(basic_tran)
        #basic_tran is a real car, i.e. the component we want to decorate
        @basic_tran = basic_tran
        super(@basic_tran.cost, @basic_tran.firm, @basic_tran.age)
        @extra_cost = 0
        @description = "no extra tran"
    end
    
    # override the cost method to include the cost of the extra feature	
    def cost        
        return @extra_cost + @basic_tran.cost
    end
    
    # override the details method to include the description of the extra feature
    def details
        return  @description + ": " + "#{@extra_cost}" + ". " + @basic_tran.details
    end
    
end # ends the CarDecorator class


# a concrete decorator --  define an extra feature


class ElectricWindowsDecorator < TranDecorator
    def initialize(basic_tran)
        super(basic_tran)
        @extra_cost = 2
        @description = "Biotene"
    end
    
end # ends the ElectricWindowsDecorator class



