class Admin < ActiveRecord::Base
	has_secure_password
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates :username, presence: true, length: { maximum: 50 }
	validates :password, length: { minimum: 6 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false } 
	def Admin.new_remember_token
		SecureRandom.urlsafe_base64
	end
	def Admin.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
	private
	def create_remember_token
		self.remember_token = Admin.encrypt(Admin.new_remember_token)
	end
end
