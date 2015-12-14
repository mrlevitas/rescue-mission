require "pry"

class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new

  end

  def create
    @question = Question.create!(name: params[:question][:name], description: params[:question][:description])
    redirect_to action: "index"
  end
end
