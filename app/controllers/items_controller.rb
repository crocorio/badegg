class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def index
  end
  
  def new
  end

  def create
  end 
end
