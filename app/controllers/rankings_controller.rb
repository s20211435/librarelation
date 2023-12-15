class RankingsController < ApplicationController
  before_action :set_ranking, only: %i[ show edit update destroy ]

  # GET /rankings or /rankings.json
  def index
    @rankings = Ranking.all
  end

  # GET /rankings/1 or /rankings/1.json
  def show
  end

  # GET /rankings/new
  def new
    @ranking = Ranking.new

    @client = OpenBD::Client.new
    # @client = @client.bulk_get params["isbn"]["number"]
    if params["isbn"].present?
      @client = @client.bulk_get params["isbn"]["number"]   

      #検索内容が空または見つからなかった時
      if @client.body.include?(nil)
        @judge = "out"
        @error_txt = "見つかりませんでした。"
        @ranking.isbn_number = params["isbn"]["number"] 
        render new_ranking_path
        return
      end  

      @ranking.isbn_number = @client.body[0]["onix"]["RecordReference"]
      @ranking.title = @client.body[0]["onix"]["DescriptiveDetail"]["TitleDetail"]["TitleElement"]["TitleText"]["content"]
      if @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[0].present? && @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[1].present?
        @ranking.author_name = @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[0] + @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[1]
      elsif @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[0].present?
        @ranking.author_name = @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[0]
      elsif @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[1].present?
        @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[1]
      end
    end
    # if @client.body.include?(nil)
    #   @judge = "out"
    #   @error_txt = "見つかりませんでした。"
    #   render isbn_search_rankings_path
    #   return
    # end

    # viewにエラーメッセージを表示する処理
    # client_body_onix = @client.body[0]["onix"]
    # @ranking.isbn_number = client_body_onix["RecordReference"]
    # @ranking.title = client_body_onix["DescriptiveDetail"]["TitleDetail"]["TitleElement"]["TitleText"]["content"]
    # @ranking.author_name = client_body_onix["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[0] + @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[1]
  end

  # GET /rankings/1/edit
  def edit
  end

  # POST /rankings or /rankings.json
  def create
    @ranking = Ranking.new(ranking_params)

      if ranking_params[:bookcover].present?
        @ranking.bookcover = "#{DateTime.now.strftime('%Y%m%d%H%M%S')}-#{ranking_params[:bookcover].original_filename}" 
        save_path = Rails.root.join("app/assets/images/", @ranking.bookcover)

        File.open(save_path, "w+b") do |f|
          f.write ranking_params[:bookcover].read
        end
      end
      
      if @ranking.save #セーブができたかできなかったか
        redirect_to ranking_url(@ranking), notice: "保存成功"
        #redirect_to books_path
      else
        render :new
      end

      # respond_to do |format|
      #   if @ranking.save
      #     format.html { redirect_to ranking_url(@ranking), notice: "登録できました。" }
      #     format.json { render :show, status: :created, location: @ranking }
      #   else
      #     format.html { render :new, status: :unprocessable_entity }
      #     format.json { render json: @ranking.errors, status: :unprocessable_entity }
      #   end
      # end
  end

  # PATCH/PUT /rankings/1 or /rankings/1.json
  def update
    if ranking_params[:bookcover].present?
      @ranking.bookcover = "#{DateTime.now.strftime('%Y%m%d%H%M%S')}-#{ranking_params[:bookcover].original_filename}" 
      save_path = Rails.root.join("app/assets/images/", @ranking.bookcover)

      File.open(save_path, "w+b") do |f|
        f.write ranking_params[:bookcover].read
      end
    end

    if @ranking.update(ranking_params_except_bookcover)
      redirect_to rankings_path
    else
      render :edit
    end
  end

  # DELETE /rankings/1 or /rankings/1.json
  def destroy
    @ranking.destroy

    respond_to do |format|
      format.html { redirect_to rankings_url, notice: "削除できました。" }
      format.json { head :no_content }
    end
  end

  def isbn_search

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ranking
      @ranking = Ranking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ranking_params
      params.require(:ranking).permit(:isbn_number, :title, :author_name, :book_rank, :bookcover)
    end

    def ranking_params_except_bookcover
      params.require(:ranking).permit(:isbn_number, :title, :author_name, :book_rank)
    end
end
