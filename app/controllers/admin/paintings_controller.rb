class Admin::PaintingsController < AdminController
  def index
    @painting = Painting.new
    @paintings = Painting.all
    @groups = Group.all
  end

  def edit
    @painting = Painting.find(params[:id])
    @paintings = Painting.all
    @groups = Group.all

    render :index
  end

  def create
    @painting = Painting.new(painting_params)
    if @painting.save
      redirect_to({ action: :index }, success: "#{@painting.name} created")
    else
      @paintings = Painting.all
      @groups = Group.all
      render :index, warning: @painting.errors.full_messages.join(", ")
    end
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update(painting_params)
      redirect_to({ action: :index }, success: "#{@painting.name} updated")
    else
      @paintings = Painting.all
      @groups = Group.all
      render :index, warning: @painting.errors.full_messages.join(", ")
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    redirect_to({ action: :index }, danger: "#{@painting.name} deleted")
  end

  private
  def painting_params
    params.require(:painting).permit(
      :group_id, :active,
      :rank, :image,
      :name, :description
    )
  end
end
