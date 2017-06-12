#This service is use to handle Result related activities for a election
class ElectionResult
  def initialize(params)
    @params = params
  end

  def call
    publish_result
  end

  private

  attr_reader :params

  #This method with get the result of a particular election
  def publish_result
    votes = Vote.where("election_id = #{params[:election_id]}").order(vote_count: :desc)
    result = {}
    votes.each do |vote|
      candidate = Candidate.find(vote.candidate_id).party_name
      result[candidate] = vote.vote_count
    end
    response = {message: Message.result, result: "#{result.to_json}"}
    return response, :complete
  end

end
