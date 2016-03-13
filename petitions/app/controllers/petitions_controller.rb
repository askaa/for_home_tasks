class PetitionsController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def index
    @petitions = Petition.all.order("created_at DESC")
  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new(petition_params)
    @petition.user_id = current_user.id
    @petition.author = current_user.first_name + ' ' + current_user.last_name if current_user.present?
    if @petition.save
      redirect_to @petition, notice: 'Петиция создана!'
    else
      render 'new'
    end
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def last10
    @petitions = Petition.last(10)
  end

  private
  def petition_params
    params.require(:petition).permit(:title, :text, :author)
  end

end