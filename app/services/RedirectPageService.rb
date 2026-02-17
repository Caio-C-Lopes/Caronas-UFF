class RedirectPageService

  def initialize(itens, current_page)
    @itens = itens
    @current_page = current_page
  end

  def call
    if @itens.empty? && @current_page > 1
      @current_page - 1
    else
      @current_page
    end
  end

end