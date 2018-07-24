class User < ActiveRecord::Base
    
    has_secure_password

    has_many :reviews
    before_validation :downcase_email
    
    validates :name, presence: true
    validates :email,
        presence: true,
        uniqueness: true
    validates :password, 
        confirmation: true,
        presence: true
    validates :password_confirmation,
        presence: true,
        length: { minimum: 6 }

    def self.authenticate_with_credentials (email, password)
        
        found_user = User.find_by_email(email)
        if found_user && found_user.authenticate(password)
            true
        else
            false
        end
    end

    private

    def downcase_email
        if (self.email != nil)
        self.email = self.email.downcase
        end
    end

    def strip_whitespace
        self.email = self.email.strip unless self.email.nil?
    end


end
