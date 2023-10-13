class DealingsController < ApplicationController
  before_action :set_dealing, only: %i[ show edit update destroy ]

  # GET /dealings or /dealings.json
  def index
    @dealings = Dealing.all
  end

  # GET /dealings/1 or /dealings/1.json
  def show
  end

  # GET /dealings/new
  def new
    @dealing = Dealing.new
  end

  # GET /dealings/1/edit
  def edit
  end

  # POST /dealings or /dealings.json
  def create
    @dealing = Dealing.new(dealing_params)

    respond_to do |format|
      if @dealing.save
        format.html { redirect_to dealing_url(@dealing), notice: "作成できました" }
        format.json { render :show, status: :created, location: @dealing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dealing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dealings/1 or /dealings/1.json
  def update
    respond_to do |format|
      if @dealing.update(dealing_params)
        format.html { redirect_to dealing_url(@dealing), notice: "編集できました" }
        format.json { render :show, status: :ok, location: @dealing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dealing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dealings/1 or /dealings/1.json
  def destroy
    @dealing.destroy

    respond_to do |format|
      format.html { redirect_to dealings_url, notice: "削除できました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dealing
      @dealing = Dealing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dealing_params
      params.require(:dealing).permit(:isbn_number, :title, :author_name, :condition)
    end
end
