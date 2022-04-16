ActiveAdmin.register Page do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :slug, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :slug, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  controller do
    def show
      # Good
      @page = Page.find_by_slug(params[:id]) 
    end

    def edit
      # Good
      @page = Page.find_by_slug(params[:id]) 
    end

    def update
    @page = Page.find_by_slug(params[:id])

      if @page.update(permit_params)
        redirect_to admin_pages_path, notice: "Your page was updated"
        # flash[:notice] = "Post has been published"
        # redirect_to admin_pages_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def delete
      # Good
      @page = Page.find_by_slug(params[:id]) 
      @page.destroy
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy

      redirect_to admin_pages_path status: :see_other
    end

    private

    def permit_params 
      params.require(:page).permit(:title, :slug, :description)
    end
  end

  # config.register_javascript 'ckeditor/init.js'

  form do |f|
    text_node javascript_include_tag Ckeditor.cdn_url
    
    f.inputs do
      f.input :title
      f.input :slug
      f.input :description, :as => :ckeditor, input_html: { ckeditor: { height: 200 }, style: "margin-left: 20%" } 
    end
    f.actions
  end

  config.sort_order = 'id_asc'
  #config.batch_actions = true

  #batch actions
  # batch_action :flag, form: 
  # {
  #   type: %w[Offensive Spam Other],
  #   reason: :text,
  #   notes:  :textarea,
  #   hide:   :checkbox,
  #   date:   :datepicker
  # } 
  # do |ids, inputs|
  #   # inputs is a hash of all the form fields you requested
  #   redirect_to collection_path, notice: [ids, inputs].to_s
  # end
  
end
