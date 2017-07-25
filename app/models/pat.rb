class Pat < ActiveRecord::Base
    validates :appointment, :uniqueness => { :message => "appointment already taken" }
validates :name, :presence => true
validates :dob, :presence => true
validates :condition, :presence => true


end
