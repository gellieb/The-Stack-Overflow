class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      if @vote.votable.class.to_s == "Question"
        redirect_to @vote.votable
      else
        redirect_to @vote.votable.question
      end
    else
      [500, "SORRY, YOU CAN VOTE ONLY ONCE"]
    end

  end

  def destroy

  end



  private

  def vote_params
    params.require(:vote).permit(:user_id, :votable_type, :votable_id)
  end

end
