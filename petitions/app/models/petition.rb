class Petition < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :title, :text, presence: true

end
