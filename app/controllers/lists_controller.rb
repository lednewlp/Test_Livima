class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action  :authenticate_admin!

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.order(name: :asc)
  end

  def search
    @lists = List.search(search_params[:q])
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    prepare_form
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
    prepare_form
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'Funcionario adicionado com sucesso.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    prepare_form
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'Os dados do funcionario foram atualizados com sucesso.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'Funcionario deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def prepare_form
    @occupations = Occupation.all.pluck(:description, :id)
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name, :email, :occupation_id, :salario)
  end

  def search_params
    params.permit(:q)
  end
end
