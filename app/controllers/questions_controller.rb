require "pry"

class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
    # binding.pry
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @error_message = nil
    if params[:question][:name].length >= 40 && params[:question][:description].length >= 150
      @question = Question.find(params[:id]).update(name: params[:question][:name], description: params[:question][:description])
      redirect_to action: "show"
    else
      @question = Question.find(params[:id])
      @question[:name] = params[:question][:name]
      @question[:description] = params[:question][:description]
      @error_message = "Please fill the form in correctly: min 40 char for name and 150 for description"
      render :edit
    end
  end

  def create
    @error_message = nil
    if params[:question][:name].length >= 40 && params[:question][:description].length >= 150
      @question = Question.create!(name: params[:question][:name], description: params[:question][:description])
      redirect_to action: "index"
    else
      @question = Question.new(name: params[:question][:name], description: params[:question][:description])
      @error_message = "Please fill the form in correctly: min 40 char for name and 150 for descrition"
      render :new
    end
  end

  def destroy
    # binding.pry
    question = Question.find(params[:id])
    answers = question.answers
    answers.destroy_all
    question.destroy
    redirect_to action: "index"
  end
end
