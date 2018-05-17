class RepositoriesController < ApplicationController
  def index
    github_service = GithubService.new(session['access_hash'])
    @repos_array = github_service.get_repos
    @username = github_service.get_username
  end

  def create
    github_service = GithubService.new(session['access_hash'])
    github_service.create_repo(params[:name])

    redirect_to '/'
  end
end
