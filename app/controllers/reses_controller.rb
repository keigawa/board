class ResesController < ApplicationController
  before_action :set_my_thread 
  before_action :set_rese, only: [:edit, :update, :destroy] 

  def index
    @reses=Rese.where(my_thread_id:params[:my_thread_id])
  end

  def new
    @rese=@my_thread.reses.new
  end

  def create
    @my_thread.reses.create(rese_params)
    redirect_to my_thread_reses_path(@my_thread)
  end

  def edit
  end

  def update
    @rese.update(rese_params)
    respond_to do |format|
      format.html { redirect_to my_thread_reses_path(my_thread_id: @my_thread, id: @rese), notice: 'Res was successfully updated.' }
      format.json { head :no_content }
    end
  end

  def destroy
    @rese.destroy
    respond_to do |format|
      format.html { redirect_to my_thread_reses_path(my_thread_id: @my_thread), notice: 'Res was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
  def set_my_thread
    @my_thread = MyThread.find(params[:my_thread_id])
  end

  def set_rese
    @rese=Rese.find(params[:id])
  end

  def rese_params
    params.require(:rese).permit(:content)
  end
end


