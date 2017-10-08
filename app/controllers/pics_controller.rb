class PicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pic, only: [:edit, :update, :destroy]

  def index
    @pics = Pic.all
  end

  def new
    if params[:back]
      @pic = Pic.new(pics_params)
    else
      @pic = Pic.new
    end
  end

 def create
    @Pic = Pic.new(Pics_params)
    if @Pic.save
      redirect_to Pics_path, notice: "写真を作成しました！"
      NoticeMailer.sendmail_Pic(@Pic).deliver
    else
      render 'new'
    end
  end

  def edit
    # edit, update, destroyで共通コード
    @pic = Pic.find(params[:id])
  end

  def update
    # edit, update, destroyで共通コード
    @pic = Pic.find(params[:id])

    if @pic.update(pics_params)
      redirect_to pics_path, notice: "写真を更新しました！"
    else
      render 'edit'
    end
  end

  def confirm
    @pic = Pic.new(pics_params)
    render :new if @pic.invalid?
  end

  def destroy
    # edit, update, destroyで共通コード
    @pic = Pic.find(params[:id])
    @pic.destroy
    redirect_to pics_path, notice: "写真を削除しました！"
  end

  private
    def pics_params
      params.require(:pic).permit(:title, :content)
    end

    # idをキーとして値を取得するメソッド
    def set_pic
      @pic = Pic.find(params[:id])
    end
end
