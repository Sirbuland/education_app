class TagsDatatable
	delegate :params, :h, :link_to, :number_to_currency, :edit_package_path, :current_user, :package_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Tag.count,
      iTotalDisplayRecords: tags.total_entries,
      aaData: data
    }
  end

  private

  def data
      tags.map do |tag|
      [
        tag.name,
        tag.description,
        tag.created_at,
      ]
    end
  end

  def tags
    @tags ||= fetch_tags
  end

  def fetch_tags
    if current_user.super_admin
      @tags = Tag.order("#{sort_column} #{sort_direction}")
    else
      @tags = current_user.tags.order("#{sort_column} #{sort_direction}")
    end
    
    @tags = @tags.page(page).per_page(per_page)
    if params[:search][:value].present? and params[:search][:value] != ''
      @tags = @tags.where("lower(name) like :search", search: "%#{params[:search][:value]}%")
    end
    @tags
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