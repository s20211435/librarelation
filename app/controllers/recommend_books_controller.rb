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
    @client = OpenBD::Client.new
    # @client = @client.bulk_get params["isbn"]["number"]
    if params["isbn"].present?
      @client = @client.bulk_get params["isbn"]["number"]   

      #検索内容が空または見つからなかった時
      if @client.body.include?(nil)
        @judge = "out"
        @error_txt = "見つかりませんでした。"
        @recommend_book.ISBN_number = params["isbn"]["number"] 
        render new_recommend_books_path
        return
      end  

      @recommend_book.ISBN_number = @client.body[0]["onix"]["RecordReference"]
      @recommend_book.title = @client.body[0]["onix"]["DescriptiveDetail"]["TitleDetail"]["TitleElement"]["TitleText"]["content"]
      if @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[0].present? && @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[1].present?
        @recommend_book.author_name = @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[0] + @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[1]
      elsif @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[0].present?
        @recommend_book.author_name = @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[0]
      elsif @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[1].present?
        @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[1]
      end
    end
    # if @client.body.include?(nil)
    #   @judge = "out"
    #   @error_txt = "見つかりませんでした。"
    #   render isbn_search_recommend_books_path
    #   return
    # end

    # @recommend_book.ISBN_number = @client.body[0]["onix"]["RecordReference"]
    # @recommend_book.title = @client.body[0]["onix"]["DescriptiveDetail"]["TitleDetail"]["TitleElement"]["TitleText"]["content"]
    # @recommend_book.author_name = @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[0] + @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[1]
  end

  # GET /recommend_books/1/edit
  def edit
  end

  # POST /recommend_books or /recommend_books.json
  def create
    @recommend_book = RecommendBook.new(recommend_book_params)

    if recommend_book_params[:bookcover].present?
      @recommend_book.bookcover = "#{DateTime.now.strftime('%Y%m%d%H%M%S')}-#{recommend_book_params[:bookcover].original_filename}" 
      save_path = Rails.root.join("app/assets/images/", @recommend_book.bookcover)

      File.open(save_path, "w+b") do |f|
        f.write recommend_book_params[:bookcover].read
      end
    end

    if @recommend_book.save #セーブができたかできなかったか
      redirect_to recommend_book_url(@recommend_book), notice: "保存成功"
      #redirect_to books_path
    else
      render :new
    end

    # respond_to do |format|
    #   if @recommend_book.save
    #     format.html { redirect_to recommend_book_url(@recommend_book), notice: "作成できました" }
    #     format.json { render :show, status: :created, location: @recommend_book }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @recommend_book.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /recommend_books/1 or /recommend_books/1.json
  def update
    if recommend_book_params[:bookcover].present?
      @recommend_book.bookcover = "#{DateTime.now.strftime('%Y%m%d%H%M%S')}-#{recommend_book_params[:bookcover].original_filename}" 
      save_path = Rails.root.join("app/assets/images/", @recommend_book.bookcover)

      File.open(save_path, "w+b") do |f|
        f.write recommend_book_params[:bookcover].read
      end
    end

    if @recommend_book.update(recommend_book_params_except_bookcover)
      redirect_to recommend_books_path
    else
      render :edit
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

  def isbn_search

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommend_book
      @recommend_book = RecommendBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recommend_book_params
      params.require(:recommend_book).permit(:ISBN_number, :title, :author_name, :recommend, :bookcover, :id_coppy)
    end

    def recommend_book_params_except_bookcover
      params.require(:recommend_book).permit(:ISBN_number, :title, :author_name, :recommend, :id_coppy)
    end
end
