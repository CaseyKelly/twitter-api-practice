class GithubController < ApplicationController

  attr_accessor :github
  private :github

  def authorize
    github  = Github.new client_id: '...', client_secret: '...'
    address = github.authorize_url redirect_uri: 'http://...', scope: 'repo'
    redirect_to address
  end

  def callback
    authorization_code = params[:code]
    access_token = github.get_token authorization_code
    access_token.token   # => returns token value
  end

  def commit_list
    github = Github.new
    github.repos.commits.list 'CaseyKelly'
  end

end
