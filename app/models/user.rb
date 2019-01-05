class User < ApplicationRecord
    acts_as_authentic
    has_many :films
    has_many :assignments
    has_many :roles, :through => :assignments

    def role_symbols
        roles.map do |role|
          role.name.underscore.to_sym
        end
    end

    acts_as_authentic do |c|
        # c.validates_length_of_password_field_options = {:on => :update, :minimum => 4, :if => :has_no_credentials?}
        # c.validates_length_of_password_confirmation_field_options = {:on => :update, :minimum => 4, :if => :has_no_credentials?}
        # c.crypto_provider = Authlogic::CryptoProviders::Sha512

        # FIX should use the below to transfer users to new CryptoProvider
        c.transition_from_crypto_providers = [Authlogic::CryptoProviders::Sha512]
        c.crypto_provider = Authlogic::CryptoProviders::SCrypt
      end

    
    
    validates :email,
    format: {
      with: /@/,
      message: "should look like an email address."
    },
    length: { maximum: 100 },
    uniqueness: {
      case_sensitive: false,
      if: :will_save_change_to_email?
    }

  validates :username,
    format: {
      with: /\A[a-z0-9]+\z/,
      message: "should use only letters and numbers."
    },
    length: { within: 4..100 },
    uniqueness: {
      case_sensitive: false,
      if: :will_save_change_to_username?
    }

#   validates :password,
#     confirmation: { if: :require_password? },
#     length: {
#       minimum: 8,
#       if: :require_password?
#     }
#   validates :password_confirmation,
#     length: {
#       minimum: 8,
#       if: :require_password?
#   }
end