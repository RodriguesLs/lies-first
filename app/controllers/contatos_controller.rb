class ContatosController < ApplicationController
  before_action :set_contato, only: [:show, :edit, :update, :destroy]
  before_action :set_options_for_select, only: [:new, :edit, :update, :create]
  http_basic_authenticate_with name: "lies", password: "159", only: :destroy
  
  # GET /contatos
  # GET /contatos.json
  def index
    @contatos = Contato.order(:nome).page(params[:page]).per(16)
  end

  # GET /contatos/1
  # GET /contatos/1.json
  def show
  end

  # GET /contatos/new
  def new
    @contato = Contato.new
    @contato.build_endereco
  end

  # GET /contatos/1/edit
  def edit
    
  end

  # POST /contatos
  # POST /contatos.json
  def create
    @contato = Contato.new(contato_params)

    respond_to do |format|
      if @contato.save
        format.html { redirect_to contatos_path, notice: I18n.t('messages.created') }
        format.json { render :show, status: :created, location: @contato }
      else
        format.html { render :new }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contatos/1
  # PATCH/PUT /contatos/1.json
  def update
    respond_to do |format|
      if @contato.update(contato_params)
        format.html { redirect_to contatos_path, notice: I18n.t('messages.updated') }
        format.json { render :show, status: :ok, location: @contato }
      else
        format.html { render :edit }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contatos/1
  # DELETE /contatos/1.json
  def destroy
    @contato.destroy
    respond_to do |format|
      format.html { redirect_to contatos_url, notice: I18n.t('messages.destroyed') }
      format.json { head :no_content }
    end
  end

  private
  
    def set_options_for_select
      @tipo_options_for_select = Tipo.all
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_contato
      @contato = Contato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contato_params
      params.require(:contato).permit(:nome, :email, :tipo_id, :obs, 
                    endereco_attributes: [:rua, :cidade, :estado], 
                    telefones_attributes: [:id, :tel, :_destroy])
    end
end
