class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :carts, dependent: :destroy

  def self.find_for_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      Rails.logger.info auth
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20],
                           )
    end
    user
  end
#   def self.from_omniauth(access_token)
#     data = access_token.info
#     user = User.where(:email => data["email"]).first
#
#     # Uncomment the section below if you want users to be created if they don't exist
#     unless user
#          user = User.create(name: data["name"],
#             email: data["email"],
#             password: Devise.friendly_token[0,20]
#          )
#     end
#     user
# end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
