class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  field :first_name
  field :last_name
  
  validates_uniqueness_of :email 
  #validates_presence_of :email
  # Setup accessible (or protected) attributes for your model  
  attr_accessible :first_name,:last_name,:email, :password, :password_confirmation  
  
  has_one :proaccount
  has_many :requests
  has_many :bids
  
  after_create :send_mail
  
  def send_mail
    UserMailer.welcome_email(self).deliver
  end
end


