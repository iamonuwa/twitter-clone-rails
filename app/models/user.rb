class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy

  acts_as_follower
  acts_as_followable


  validates :username, uniqueness: { case_sensitive: true },
                      format: { with: /\A[a-zA-Z0-9]+\z/ },
                      presence: true,
                      allow_blank: false
       

  def generate_jwt
  JWT.encode({ id: id,
              exp: 60.days.from_now.to_i },
              Rails.application.secrets.secret_key_base)
  end
end
