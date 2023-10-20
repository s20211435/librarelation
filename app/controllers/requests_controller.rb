class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show edit update destroy ]

  # GET /requests or /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1 or /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
    @client = OpenBD::Client.new
    @client = @client.bulk_get params["isbn"]["number"]
    @request.isbn_number = @client.body[0]["onix"]["RecordReference"]
    @request.title = @client.body[0]["onix"]["DescriptiveDetail"]["TitleDetail"]["TitleElement"]["TitleText"]["content"]
    @request.author_name = @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[0] + @client.body[0]["onix"]["DescriptiveDetail"]["Contributor"][1]["PersonName"]["content"].split(",")[1]
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to request_url(@request), notice: "登録できました。" }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to request_url(@request), notice: "編集できました。" }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url, notice: "削除できました" }
      format.json { head :no_content }
    end
  end

  def isbn_search

  end

  def isbn_search_process
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:isbn_number, :title, :author_name, :reason, :grade, :kumi, :number, :name)
    end
end
