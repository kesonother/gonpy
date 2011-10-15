class Request
  include Mongoid::Document
  
  field :subject, :type => String  
  field :zipcode, :type => Integer
  field :details, :type => String
  field :activate, :type => Boolean
  field :choice, :type => Boolean  
  field :libelle_category
  belongs_to :proaccount
  belongs_to :category
  #referenced_in :category
end
