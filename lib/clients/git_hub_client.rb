class GitHubClient
  
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '666925b13d3577ed3fae5a2f5e965abe16ff5801'

  def initialize
    @http_client = setup_http_client
  end
  
  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = "application/json"
      request.body = params.to_json
    end
  end
  
  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
  
end
