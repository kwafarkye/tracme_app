class User < ActiveRecord::Base
   before_save { self.email = email.downcase }

   # Validate the name and email of the user are present
   validates(:name, presence: true, length: {maximum: 50})
   # Regular Expression for email validation
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+[a-z\d]+\.[a-z]+\z/i
   validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false })

   has_secure_password
   validates(:password, length: {minimum: 6})
end
