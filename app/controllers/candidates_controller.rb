class CandidatesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_election
    before_action :set_candidate, only: [:edit, :update, :activate, :deactivate]

    def index
        @candidates = @election.candidates.order(candidate_number: :asc, created_at: :asc)
    end

    def new
        @candidate = Candidate.new
    end
    
    def create
        @candidate = @election.candidates.new(candidate_params)

        if @candidate.save
            redirect_to election_candidates_path(@election), notice: "Candidate #{@candidate.name} was successfully created for Election #{@election.title}"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @candidate.update(candidate_params)
            redirect_to election_candidates_path(@election), notice: "Candidate #{@candidate.name} was successfully updated for Election #{@election.title}"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def activate
        @candidate.active!
        redirect_to election_candidates_path, notice: "Candidate #{@candidate.name} was activated" 
    end

    def deactivate
        @candidate.inactive!
        redirect_to election_candidates_path, notice: "Candidate #{@candidate.name} was deactivated" 
    end

    private
    def set_election
        @election = Election.find(params[:election_id])
    end

    def set_candidate
        @candidate = Candidate.find(params[:id])
    end

    def candidate_params
        params.required(:candidate).permit(
            :name,
            :image,
            :gender,
            :birth_date,
            :short_bio,
            :description,
            :occupation,
            :education,
            :experience,
            :vision,
            :mission,
            :candidate_number
        )
    end
end
