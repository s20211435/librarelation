class DealingController < ApplicationController
  def top
      @all_dealings = Dealing.all
  end
end
