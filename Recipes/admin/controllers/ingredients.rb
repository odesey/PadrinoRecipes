Recipes::Admin.controllers :ingredients do
  get :index do
    @title = "Ingredients"
    @ingredients = Ingredient.all
    render 'ingredients/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'ingredient')
    @ingredient = Ingredient.new
    render 'ingredients/new'
  end

  post :create do
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      @title = pat(:create_title, :model => "ingredient #{@ingredient.id}")
      flash[:success] = pat(:create_success, :model => 'Ingredient')
      params[:save_and_continue] ? redirect(url(:ingredients, :index)) : redirect(url(:ingredients, :edit, :id => @ingredient.id))
    else
      @title = pat(:create_title, :model => 'ingredient')
      flash.now[:error] = pat(:create_error, :model => 'ingredient')
      render 'ingredients/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "ingredient #{params[:id]}")
    @ingredient = Ingredient.find(params[:id])
    if @ingredient
      render 'ingredients/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'ingredient', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "ingredient #{params[:id]}")
    @ingredient = Ingredient.find(params[:id])
    if @ingredient
      if @ingredient.update_attributes(params[:ingredient])
        flash[:success] = pat(:update_success, :model => 'Ingredient', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:ingredients, :index)) :
          redirect(url(:ingredients, :edit, :id => @ingredient.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'ingredient')
        render 'ingredients/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'ingredient', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Ingredients"
    ingredient = Ingredient.find(params[:id])
    if ingredient
      if ingredient.destroy
        flash[:success] = pat(:delete_success, :model => 'Ingredient', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'ingredient')
      end
      redirect url(:ingredients, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'ingredient', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Ingredients"
    unless params[:ingredient_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'ingredient')
      redirect(url(:ingredients, :index))
    end
    ids = params[:ingredient_ids].split(',').map(&:strip).map(&:to_i)
    ingredients = Ingredient.find(ids)
    
    if Ingredient.destroy ingredients
    
      flash[:success] = pat(:destroy_many_success, :model => 'Ingredients', :ids => "#{ids.to_sentence}")
    end
    redirect url(:ingredients, :index)
  end
end
