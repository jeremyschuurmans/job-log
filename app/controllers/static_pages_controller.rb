class StaticPagesController < ApplicationController
  layout "form_page"

  def index
    render 'index'
  end
end
