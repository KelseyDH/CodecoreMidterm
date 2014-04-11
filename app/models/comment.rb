class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

validates_presence_of :body, message: "comment must contain text"


scope :ordered_by_creation, -> {order("created_at DESC")}

end
