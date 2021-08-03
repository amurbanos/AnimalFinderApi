class User < ApplicationRecord

	has_many :pets

    validates_length_of :name, minimum: 5, maximum: 255 
    validates :email, presence: true
    validates :email, uniqueness: true, :on => :create
    validates :phone, presence: true

    has_secure_password

	def as_json(options={})
	{
	  :id => id,
	  :name => name,
	  :email => email,
	  :phone => phone 
	}
	end
    
end