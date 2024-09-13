class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable,         :two_factor_authenticatable, :jwt_authenticatable,:omniauthable,
         jwt_revocation_strategy: JwtBlacklist,omniauth_providers: %i[google_oauth2 apple]

  # Two-factor authentication settings
  devise :two_factor_backupable, otp_secret_encryption_key: ENV['OTP_SECRET_ENCRYPTION_KEY']

  # Define roles
  enum role: { user: 0, admin: 1 }


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.mobile = auth.info.mobile
      user.password = Devise.friendly_token[0, 20]   
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name  
    end
  end
end


