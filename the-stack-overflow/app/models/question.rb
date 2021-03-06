class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :user_id, presence: true

  def best_answer
    self.answers.find_by(best: true)
  end

  def answer_sort
    best = self.answers.delete(best_answer)
    self.answers.unshift(best)
  end

  def voted?(user)
    self.votes.include?(Vote.find_by(user: user))
  end

end
