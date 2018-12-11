class CategoriesDatatable
	delegate :params, :h, :link_to, :number_to_currency, :edit_package_path, :current_user, :package_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Category.count,
      iTotalDisplayRecords: categories.total_entries,
      aaData: data
    }
  end

  private

  def data
    categories.map do |category|
      [
        category.name,
        category.description,
        category.created_at,
      ]
    end
  end

  def categories
    @categories ||= fetch_categories
  end

  def fetch_categories
    if current_user.super_admin
      @categories = Category.order("#{sort_column} #{sort_direction}")
    else
      @categories = current_user.categories.order("#{sort_column} #{sort_direction}")
    end
    
    @categories = @categories.page(page).per_page(per_page)
    if params[:search][:value].present? and params[:search][:value] != ''
      @categories = @categories.where("lower(name) like :search", search: "%#{params[:search][:value]}%")
    end
    @categories
  end

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  def sort_column
    columns = %w[name price created_at]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end