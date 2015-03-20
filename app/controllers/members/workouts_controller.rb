# -*- encoding : utf-8 -*-
class Members::WorkoutsController < Members::ApplicationController

  def index
    @workouts = current_user.workouts    
  end

  def create
    workout = Workout.new params[:workout]
    workout.user = current_user

    if workout.save
      redirect_to members_workouts_path
    else
      flash[:warning] = "Fehler beim speichern!"
      redirect_to members_workouts_path
    end
  end
end
