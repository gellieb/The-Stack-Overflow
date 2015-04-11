class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable


  # def self.sort_by_votes
  #   order('votes asc')
  # end

  def best_answer
    self.answers.find_by(best: true)
  end


end
