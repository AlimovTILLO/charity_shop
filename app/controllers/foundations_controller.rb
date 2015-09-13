class FoundationsController < ApplicationController
  def index
  	@foundations = Foundation.all
  end
end
