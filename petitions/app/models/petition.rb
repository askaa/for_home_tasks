class Petition < ActiveRecord::Base

  EXPIRATION_DATE = 30
  VOTES_THRESHOLD = 100

  belongs_to :user
  has_many :votes

  validates :user_id, :title, :text, presence: true
  validate :edit_only_active_petition, on: :update

  def edit_only_active_petition
    petition = Petition.find(petition_id)
    errors.add(:petition_id, 'Нельзя редактировать устаревшую петицию') if petition.expired?
  end

  def expired?
    created_at < EXPIRATION_DATE.day.ago
  end

end
