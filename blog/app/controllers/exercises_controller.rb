class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def edit
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      flash.now[:notice] = "Nova vježba uspješno dodana"
      redirect_to '/exercises'
    else
      flash.now[:error] = "Oba polja moraju biti ispunjena"
      render '/exercises/new'
    end
  end

  def update
  end

  def delete
  end
end

private

  def exercise_params
    params.require(:exercise).permit(:name, :muscle_group)
  end
