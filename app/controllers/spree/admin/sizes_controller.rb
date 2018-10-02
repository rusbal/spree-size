class Spree::Admin::SizesController < Spree::Admin::ResourceController

  def index
    session[:return_to] = request.url
    respond_with(@collection)
  end

  protected

  def collection
    return @collection if @collection.present?
    params[:q] ||= {}
    params[:q][:deleted_at_null] ||= '1'
    params[:q][:not_discontinued] ||= '1'

    params[:q][:s] ||= 'name asc'
    @collection = super
    # @search needs to be defined as this is passed to search_form_for
    # Temporarily remove params[:q][:deleted_at_null] from params[:q] to ransack sizes.
    # This is to include all sizes and not just deleted sizes.
    @search = @collection.ransack(params[:q].reject { |k, _v| k.to_s == 'deleted_at_null' })
    @collection = @search.result.page(params[:page])
    @collection
  end

end
