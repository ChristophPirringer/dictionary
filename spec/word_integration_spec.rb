require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the dictionary path', {:type => :feature}) do

  before() do
    Word.clear()
  end


  it('adds a word at the index page named "BadWolf",
    checks the page for it.') do
    visit('/')
    fill_in('word', :with => 'BadWolf')
    click_button('Add The Word!')
    expect(page).to have_content('BadWolf')
  end

  it('adds a word at the index page named "BadWolf",
    removes it, checks the page for it.') do
    visit('/')
    fill_in('word', :with => 'BadWolf')
    click_button('Add The Word!')
    click_link('Exterminate!')
    expect(page).to have_no_content('BadWolf')
  end

  it('goes to the word-page of the word it created,
    adds a definition and checks for it in the word-page.') do
    visit('/')
    fill_in('word', :with => 'BadWolf')
    click_button('Add The Word!')
    click_link('BadWolf')
    fill_in('definition', :with => 'Rose')
    click_button('Add the definition!')
    expect(page).to have_content('Rose')
  end

end
