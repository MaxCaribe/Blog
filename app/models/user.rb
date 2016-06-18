class User < ActiveRecord::Base
  self.primary_key=:login
  has_many :articles

end

