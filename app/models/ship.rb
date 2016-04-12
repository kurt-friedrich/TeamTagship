class Ship < ActiveRecord::Base
  belongs_to :user
  validates :body, length: { minimum: 1, maximum: 170 }

  def self.timeline(user)
    following_ids = user.followees(User, pluck: :id)
    all_ids= following_ids << user.id
    self.where(user_id: all_ids).order("created_at DESC")
  end

end
