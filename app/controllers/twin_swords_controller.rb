class TwinSwordsController < ApplicationController
  before_action :set_twin_swords

  def index
    render json: @twin_swords.map{ |sword| sword.to_hash }
  end

  def show
    twin_sword = @twin_swords[params[:id]]

    respond_to do |format|
      if twin_sword
        format.html
      else
        format.html{ head :bad_request }
      end
    end
  end

  private

  def set_twin_swords
    @twin_swords = YAMLTwinSword.new
  end
end
