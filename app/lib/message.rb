class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.account_created
    'Account created successfully'
  end

  def self.account_not_created
    'Account could not be created'
  end

  def self.expired_token
    'Sorry, your token has expired. Please login to continue.'
  end
  
  def self.election_created
    'Election created successfully'
  end
  
  def self.candidate_created
    'Candidate created successfully'
  end
  
  def self.invalid_candidate
    'Candidate not found'
  end
  
  def self.forbidden_voting
    'Voting unsuccessful'
  end
  
  def self.invalid_user_or_election
    'User or Election not found'
  end
  
  def self.voting_success
    'Voted Successfully'
  end
  
  def self.result
    'Result'
  end
end