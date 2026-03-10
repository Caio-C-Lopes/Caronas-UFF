require 'rails_helper'

RSpec.feature "Caronas", type: :feature, js: true do

  describe 'Create a carona' do
    context 'where departure and destination are campus' do
      it 'creates a carona successfully' do
        visit(new_carona_path)
        departure_campus = create(:campus, title: 'Campus Gragoatá')
        destination_campus = create(:campus, title: 'Campus Valonguinho')

        fill_in('Nome do Motorista', with: 'João Silva')
        fill_in('Número de Passageiros', with: 3)
        fill_in('Custo', with: '15.50')
        fill_in('Observações', with: 'saindo agora')

        check 'departure_is_campus'
        within('.departure-select-wrapper') do
          find('.select2-container').click
        end
        find('.select2-search__field').set('Gragoatá')
        find('.select2-results__option', text: 'Campus Gragoatá', wait: 2).click

        check 'destination_is_campus'
        within('.destination-select-wrapper') do
          find('.select2-container').click
        end
        find('.select2-search__field').set('Valonguinho')
        find('.select2-results__option', text: 'Campus Valonguinho', wait: 2).click

        page.execute_script("document.querySelector('.datetimepicker')
        ._flatpickr.setDate('#{Time.current.in_time_zone("America/Sao_Paulo")}')")

        click_link 'Adicionar Parada'

        nested_field = find('#carona_paradas .nested-fields input[name*="[parada_attributes][title]"]', wait: 1)
        nested_field.set('Terminal João Goulart')  

        click_link 'Adicionar Parada'
        nested_field = find('#carona_paradas .nested-fields:nth-of-type(2) input[name*="[parada_attributes][title]"]', wait: 1)
        nested_field.set('Padaria Pão Do Céu')    

        click_button 'Finalizar'
        page.driver.browser.manage.window.resize_to(1920, 1080) #configuração no capybara
        page.save_screenshot('carona_with_departure_and_destination_as_campus.png')
        expect(page).to have_content('Campus Gragoatá')
        expect(page).to have_content('Campus Valonguinho')
        expect(page).to have_content('Terminal João Goulart')
        expect(page).to have_content('Padaria Pão Do Céu')        
      end
    end

    context 'where departure is a campus and destination is an address' do
      it 'creates a carona successfully' do
        visit(new_carona_path)
        departure_campus = create(:campus, title: 'Campus Gragoatá')

        fill_in('Nome do Motorista', with: 'Maria Souza')
        fill_in('Número de Passageiros', with: 2)
        fill_in('Custo', with: '10.22')
        fill_in('Observações', with: 'rápido e confort')

        check 'departure_is_campus'
        within('.departure-select-wrapper') do
          find('.select2-container').click
        end
        find('.select2-search__field').set('Gragoatá')
        find('.select2-results__option', text: 'Campus Gragoatá', wait: 2).click

        fill_in 'carona_destination', with: 'Rua das Flores, 123'

        page.execute_script("document.querySelector('.datetimepicker')
        ._flatpickr.setDate('#{Time.current.in_time_zone("America/Sao_Paulo")}')")

        click_button 'Finalizar'
        page.driver.browser.manage.window.resize_to(1920, 1080)
        page.save_screenshot('carona_with_departure_as_campus.png')    
        expect(page).to have_content('Maria Souza')
        expect(page).to have_content('Campus Gragoatá')
        expect(page).to have_content('Rua das Flores, 123')        
      end
    end

    context 'where destination is a campus and departure is an address' do
      it 'creates a carona successfully' do
        visit(new_carona_path)
        destination_campus = create(:campus, title: 'Campus Praia Vermelha')

        fill_in('Nome do Motorista', with: 'Carlos Lima')
        fill_in('Número de Passageiros', with: 4)
        fill_in('Custo', with: '20.00')
        fill_in('Observações', with: 'não levo flamenguista')

        fill_in 'carona_departure', with: 'Rua do Mercado, 456'

        check 'destination_is_campus'
        within('.destination-select-wrapper') do
          find('.select2-container').click
        end
        find('.select2-search__field').set('Praia Vermelha')
        find('.select2-results__option', text: 'Campus Praia Vermelha', wait: 2).click

        page.execute_script("document.querySelector('.datetimepicker')
        ._flatpickr.setDate('#{Time.current.in_time_zone("America/Sao_Paulo")}')")

        click_button 'Finalizar'
        page.driver.browser.manage.window.resize_to(1920, 1080)
        page.save_screenshot('carona_with_destination_as_campus.png')    
        expect(page).to have_content('Carlos Lima')
        expect(page).to have_content('Rua do Mercado, 456')
        expect(page).to have_content('Campus Praia Vermelha')
      end
    end
  end

end