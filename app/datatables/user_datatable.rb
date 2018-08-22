class UserDatatable

  delegate :params, :h, :link_to, :number_to_currency, :pending_application_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: User.count,
      iTotalDisplayRecords: users.total_entries,
      aaData: data
    }
  end

  private

  def data
    users.map do |user|
      [
        user.id,
        user.full_name,
        country_name(user.country),
        user.email,
        user.qualification,
        user.occupation,
        user.created_at.strftime("%B %e, %Y"),
        "<a href='#{pending_application_path(id: user.id, activate: true)}' data-remote='true' data-method='put' class='mr-1'>Activate</a>".html_safe
      ]
    end
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users = User.order("#{sort_column} #{sort_direction}")
    users = users.where("activated is false and role = 1").page(page).per_page(per_page)
    if params[:search][:value].present? and params[:search][:value] != ''
      users = users.where("full_name like :search or username like :search", search: "%#{params[:search]}%")
    end
    users
  end

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  def sort_column
    columns = %w[full_name username id created_at]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

  def country_name(country_code)
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name if country.present?
  end

end
