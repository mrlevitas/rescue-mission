class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /questions/:question_id/answers
  def create

    # @answer = Answer.new(answer_params)
    # @answer = Answer.create!(description: params[:answer][:description] , question_id: params[:question_id])
    # binding.pry
    @question = Question.find(params[:question_id])

    @answer = Answer.create!(answer_params)
    # question = Question.find(params[:answer][:question_id])
    # @answer = Answer.create!(description: params[:answer][:description] )
    #
    # respond_to do |format|
    #   if @answer.save
    #     format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
    #     format.json { render :show, status: :created, location: @answer }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @answer.errors, status: :unprocessable_entity }
    #   end
    # end
    redirect_to question_path(@question)
    # action: "show" , :controller=>"questions"


  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      # params.permit(:question_id )
      answer_params = {}
      # binding.pry
      answer_params.store(:question_id, params.require(:question_id))
      answer_params.store(:description , params.require(:answer).require(:description))
      
      answer_params.store(:user_id , session[:user_id])
      return answer_params
    end
end
