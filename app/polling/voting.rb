#This service handles the voting related activities 
#to make sure the voting is done based on required rules
class Voting
  def initialize(params)
    @params = params
  end
  
  def call
    vote
  end
  
  private
  
  attr_reader :params
  
  #This is the method with allows the user to vote and know its feedback 
  #based on the rules for a election
  def vote
    vote_state = false
    user = User.find_by_electoral_id(params[:electoral_id])
    election = Election.find(params[:election_id])
    candidate = Candidate.find(params[:candidate_id])

    if user and election

      user_voting = UserVoting.where("election_id = #{election.id} and user_id = #{user.id}").first
      voting = Vote.where( "election_id = #{election.id} and candidate_id = #{candidate.id}").first

      if user_voting
        count = user_voting.voting_count
        if count.to_i < election.max_votes_per_user
          if candidate
            #TODO: Transaction have to be implemented  
            user_voting.update_attribute(:voting_count, count+1)
            vote_state = true
          else
            response = {message: Message.invalid_candidate}
            return response, :not_found
          end
        else
          response = {message: Message.forbidden_voting}
          return response, :forbidden
        end
      else
        if !user_voting
          params.update(voting_count: 1, user_id: user.id)
          UserVoting.create!(user_voting_params) 
        end
        vote_state = true
      end
    else
      response = {message: Message.invalid_user_or_election}
      return response, :not_found
    end
    if vote_state 
      if !voting  
        voting = Vote.create!(vote_params)
      end
      v_count = voting.vote_count.to_i
      voting.update_attribute(:vote_count, v_count + 1)
      response = {message: Message.voting_success}
      return response, :created
    end
  end
  
  #parameters for a user_voting table that are permitted in the request
  def user_voting_params
    params.permit(
      :voting_count,
      :user_id,
      :election_id)
  end

  #parameters for a votes table that are permitted in the request
  def vote_params
    params.permit(
      :election_id,
      :candidate_id     
    )
  end

  
  
end
