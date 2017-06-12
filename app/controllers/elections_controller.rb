class ElectionsController < ApplicationController
  before_filter :voting_params, only: :voting

  # POST /create
  # return authenticated token upon signup
  def create
    Election.create!(election_params)    
    response = { message: Message.election_created}
    json_response(response, :created)
  end

  # POST /create_candidate
  def create_candidate
    Candidate.create!(candidate_params)    
    response = { message: Message.candidate_created}
    json_response(response, :created)
  end

  # POST /voting
  def voting
    response = Voting.new(params).call
    json_response(response[0], response[1])
  end
  
  # GET/results
  def result
    response = ElectionResult.new(params).call
    json_response(response[0], response[1])
  end

  private

  def election_params
    params.permit(
      :title,
      :description,
      :max_votes_per_user
    )
  end

  def candidate_params
    params.permit(
      :election_id,
      :user_id,
      :party_name
    )
  end

  def voting_params
    params.require(:electoral_id)
    params.require(:candidate_id)
    params.require(:election_id)
  end
end