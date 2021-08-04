class User < ApplicationRecord

	has_many :pets

    validates_length_of :name, minimum: 5, maximum: 255 
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :email, uniqueness: true, :on => :create
    validates :phone, presence: true
    validates_length_of :password, minimum: 6, maximum: 255 

    has_secure_password

	def as_json(options={})
	{
	  :id => id,
	  :name => name,
	  :email => email,
	  :phone => phone, 
	  :pets => pets
	}
	end
    
end