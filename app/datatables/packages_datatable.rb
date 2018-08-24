class PackagesDatatable
	delegate :params, :h, :link_to, :number_to_currency, :edit_package_path, :current_user, :package_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Package.count,
      iTotalDisplayRecords: packages.total_entries,
      aaData: data
    }
  end

  private

  def data
    packages.map do |package|
      [
        package.name,
        package.price,
        package.total_number_of_characters,
        package.total_credits,
        package.bonus,
        package.created_at.strftime("%B %e, %Y")
      ]
    end
  end

  def packages
    @packages ||= fetch_packages
  end

  def fetch_packages
    if current_user.super_admin
      @packages = Package.order("#{sort_column} #{sort_direction}")
    else
      @packages = current_user.packages.order("#{sort_column} #{sort_direction}")
    end
    
    @packages = @packages.page(page).per_page(per_page)
    if params[:search][:value].present? and params[:search][:value] != ''
      @packages = @packages.where("lower(name) like :search", search: "%#{params[:search][:value]}%")
    end
    @packages
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