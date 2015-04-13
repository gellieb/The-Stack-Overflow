class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :user_id, presence: true

  def best_answer
    self.answers.find_by(best: true)
  end

  # It's a bit odd to have a method that sorts a database table like this.
  # Typically, you'd just leave the table as is and use .order to get it in
  # order. For example, you could use .order(best: :descending) to get
  # the best answer(s?) first.
  def answer_sort
    best = self.answers.delete(best_answer)
    # If there's no best answer, you'll insert a nil answer here.
    self.answers.unshift(best)
  end

  def voted?(user)
    self.votes.include?(Vote.find_by(user: user))
  end

  # All commentables should respond question
  def question
    self
  end
end
