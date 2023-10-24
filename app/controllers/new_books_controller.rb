class NewBooksController < ApplicationController
  before_action :set_new_book, only: %i[ show edit update destroy ]

  # GET /new_books or /new_books.json
  def index
    @new_books = NewBook.all
  end

  # GET /new_books/1 or /new_books/1.json
  def show
  end

  # GET /new_books/new
  def new

    @new_book = NewBook.new

    @client = OpenBD::Client.new
    @client = @client.bulk_get params["isbn"]["number"]
    @new_book.isbn_number = @client.body[0]["onix"]["RecordReference"]
    @new_book.title = @client.body[0]["onix"]["DescriptiveDetail"]["TitleDetail"]["TitleElement"]["TitleText"]["content"]
    @new_book.author_name = @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[0] + @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[1]
  end

  # GET /new_books/1/edit
  def edit
  end

  # POST /new_books or /new_books.json
  def create
    @new_book = NewBook.new(new_book_params)

    respond_to do |format|
      if @new_book.save
        format.html { redirect_to new_book_url(@new_book), notice: "登録できました。" }
        format.json { render :show, status: :created, location: @new_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @new_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_books/1 or /new_books/1.json
  def update
    respond_to do |format|
      if @new_book.update(new_book_params)
        format.html { redirect_to new_book_url(@new_book), notice: "編集できました。" }
        format.json { render :show, status: :ok, location: @new_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @new_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_books/1 or /new_books/1.json
  def destroy
    @new_book.destroy

    respond_to do |format|
      format.html { redirect_to new_books_url, notice: "削除できました。" }
      format.json { head :no_content }
    end
  end

  def isbn_search

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_book
      @new_book = NewBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def new_book_params
      params.require(:new_book).permit(:isbn_number, :title, :author_name, :arrival_day, :lending, :book_number, :genre)
    end
end
