feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
  scenario 'expect page to return some urls or links' do
    visit('/')
    have_link(:href => "bookmarks")
  end

  scenario 'click link for view' do
    visit('/')
    click_link 'View Bookmarks'
    expect(page).to have_content "array of bookmarks"
  end

  scenario 'A user can see bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

end
