require 'rails_helper'

RSpec.feature "Campi", type: :feature, js: true do
  it 'Search a campus with autocomplete and select2' do
    campus = create(:campus, title: 'Campus Praia Vermelha')

    visit(campi_path)

    find('.select2-container').click
    find('.select2-search__field').set('Praia Vermelha')
    find('.select2-results__option', text: 'Campus Praia Vermelha', wait: 2).click

    expect(page).to have_current_path(/campi\?q=Campus%20Praia%20Vermelha/)
    expect(page).to have_content('Campus Praia Vermelha')
    page.driver.browser.manage.window.resize_to(1600, 900)
    page.save_screenshot('screenshot_search.png')
  end  

end
