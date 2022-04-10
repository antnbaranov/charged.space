class LinksController < ApplicationController

  def show
    link = Link.find_by(lookup_code: params[:lookup_code])
  end

  def create
    shortener = Shortener.new(link_params[:og_url])
    @link = shortener.generate_short_link
    # binding.pry
    if @link.persisted?
      respond_to :js
    else
      render 'error.js.erb'
    end
  end

  private

  def link_params
    params.require(:link).permit(:og_url)
  end

end

