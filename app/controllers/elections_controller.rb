class ElectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_election, only: [:edit, :update, :activate, :deactivate]
  
  def index
    @elections = Election.order(start_at: :asc)
  end

  def new
    @election = Election.new
  end

  def create
    @election = Election.new(election_params)

    if @election.save
      redirect_to root_path, notice: "Election was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @election.update(election_params)
      redirect_to root_path, notice: "Election was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def activate
    @election.active!

    redirect_to election_path(@election), notice: "Election was successfully activated"
  end

  def deactivate
    @election.inactive!

    redirect_to election_path(@election), notice: "Election was successfully deactivated"
  end

  private

  def election_params
    params.require(:election).permit(:title, :description, :start_at, :end_at, :status)
  end

  def set_election
    @election = Election.find(params[:id])
  end
end
