class Professional
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :first_name
  field :last_name
  
  validates_uniqueness_of :email
  attr_accessible :first_name,:last_name,:email, :password, :password_confirmation  
end
