class JwtBlacklist < ApplicationRecord
    validates :jti, presence: true, uniqueness: true
    validates :exp, presence: true
  
    def self.blacklisted?(jti)
      where(jti: jti).exists?
    end
  end
  