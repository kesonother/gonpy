class Avability
  include Mongoid::Document
  
  field :open_am, :type => String
  field :close_am, :type => String
  field :open_pm, :type => String
  field :close_pm, :type => String
  
end
