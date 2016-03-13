class Petition < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  validates :user_id, :title, :text, presence: true

end
