class TrainersController < ApplicationController

  def new
    @trainer = Trainer.new
  end

end
