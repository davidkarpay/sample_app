class User < ActiveRecord::Base
	attr_accessible :name, :email
# attr_accessible(:name, :email)
	validates :name, presence: true, length: { maximum: 50 }
# validates(:name, {:presence => true}, {:length => {:maximum => 50}})
	validates :email, presence: true
# validates(:email, {:presence => true})
end
