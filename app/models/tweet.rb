class Tweet < ActiveRecord::Base

    belongs_to :user
    
    scope :username, ->(username) { where(user: User.where(username: username)) }


    before_validation do
        self.slug ||= "#{title.to_s.parameterize}-#{rand(36**6).to_s(36)}"
    end

end
