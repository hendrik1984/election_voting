class ElectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_election, only: [:edit, :update, :activate, :deactivate]
  
  def index
    @elections = Election.includes(:candidates).order(created_at: :desc)
  end

  def new
    @election = Election.new
  end

  def create
    @election = Election.new(election_params)

    if @election.save
      redirect_to elections_path, notice: "Election #{@election.title} was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @election.update(election_params)
      redirect_to elections_path, notice: "Election #{@election.title} was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def activate
    @election.active!
    redirect_to elections_path, notice: "Election #{@election.title} was successfully activated"
  end

  def deactivate
    @election.inactive!
    redirect_to elections_path, notice: "Election #{@election.title} was successfully deactivated"
  end

  private

  def election_params
    params.require(:election).permit(:title, :description, :start_at, :end_at, :status)
  end

  def set_election
    @election = Election.find(params[:id])
  end
end
