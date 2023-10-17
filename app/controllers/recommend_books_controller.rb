class RecommendBooksController < ApplicationController
  before_action :set_recommend_book, only: %i[ show edit update destroy ]

  # GET /recommend_books or /recommend_books.json
  def index
    @recommend_books = RecommendBook.all
  end

  # GET /recommend_books/1 or /recommend_books/1.json
  def show
  end

  # GET /recommend_books/new
  def new
    @recommend_book = RecommendBook.new
  end

  # GET /recommend_books/1/edit
  def edit
  end

  # POST /recommend_books or /recommend_books.json
  def create
    @recommend_book = RecommendBook.new(recommend_book_params)

    respond_to do |format|
      if @recommend_book.save
        format.html { redirect_to recommend_book_url(@recommend_book), notice: "作成できました" }
        format.json { render :show, status: :created, location: @recommend_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recommend_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recommend_books/1 or /recommend_books/1.json
  def update
    respond_to do |format|
      if @recommend_book.update(recommend_book_params)
        format.html { redirect_to recommend_book_url(@recommend_book), notice: "編集できました" }
        format.json { render :show, status: :ok, location: @recommend_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recommend_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommend_books/1 or /recommend_books/1.json
  def destroy
    @recommend_book.destroy

    respond_to do |format|
      format.html { redirect_to recommend_books_url, notice: "削除できました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommend_book
      @recommend_book = RecommendBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recommend_book_params
      params.require(:recommend_book).permit(:ISBN_number, :title, :author_name, :recommend)
    end
end
