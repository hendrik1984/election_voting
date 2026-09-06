class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_election
  before_action :validate_election_status
  before_action :set_candidate
  before_action :validate_election_start
  before_action :validate_election_end

  def create
    @vote = @election.votes.new(
      user: current_user,
      candidate_id: params[:candidate_id]
    )

    if @vote.save
      redirect_to election_candidates_path(@election), notice: "Your vote was successfully submitted."
    else
      redirect_to election_candidates_path(@election), alert: @vote.errors.full_messages.to_sentence
    end
  
  rescue ActiveRecord::RecordNotUnique
    redirect_to election_candidates_path(@election), alert: "You have already voted in this election."
  end

  private

  def set_election
    @election = Election.find(params[:election_id])
  end

  def set_candidate
    @candidate = @election.candidates.find(params[:candidate_id])
  end

  def validate_election_status
    return if @election.active?
    redirect_to election_candidates_path(@election), alert: "This election is inactive and cannot accept votes."
  end

  def validate_election_start
    return if Time.current >= @election.start_at
    redirect_to election_candidates_path(@election), alert: "This election has not started yet."
  end

  def validate_election_end
    return if Time.current <= @election.end_at
    redirect_to election_candidates_path(@election), alert: "This election has already ended."
  end
end
