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

    if @client.body.include?(nil)
      @judge = "out"
      @error_txt = "見つかりませんでした。"
      render isbn_search_new_books_path
      return
    end

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

    if new_book_params[:bookcover].present?
      @new_book.bookcover = "#{DateTime.now.strftime('%Y%m%d%H%M%S')}-#{new_book_params[:bookcover].original_filename}" 
      save_path = Rails.root.join("app/assets/images/", @new_book.bookcover)

      File.open(save_path, "w+b") do |f|
        f.write new_book_params[:bookcover].read
      end
    end

    if @new_book.save #セーブができたかできなかったか
      redirect_to new_book_url(@new_book), notice: "保存成功"
      #redirect_to books_path
    else
      render :new
    end

    # respond_to do |format|
    #   if @new_book.save
    #     format.html { redirect_to new_book_url(@new_book), notice: "登録できました。" }
    #     format.json { render :show, status: :created, location: @new_book }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @new_book.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /new_books/1 or /new_books/1.json
  def update
    if new_book_params[:bookcover].present?
      @new_book.bookcover = "#{DateTime.now.strftime('%Y%m%d%H%M%S')}-#{new_book_params[:bookcover].original_filename}" 
      save_path = Rails.root.join("app/assets/images/", @new_book.bookcover)

      File.open(save_path, "w+b") do |f|
        f.write new_book_params[:bookcover].read
      end
    end

    if @new_book.update(new_book_params_except_bookcover)
      redirect_to new_books_path
    else
      render :edit
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

  def isbn_search_process

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_book
      @new_book = NewBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def new_book_params
      params.require(:new_book).permit(:isbn_number, :title, :author_name, :arrival_day, :lending, :book_number, :genre, :bookcover)
    end

    def new_book_params_except_bookcover
      params.require(:new_book).permit(:isbn_number, :title, :author_name, :arrival_day, :lending, :book_number, :genre)
    end
end
