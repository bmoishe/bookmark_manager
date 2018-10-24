feature 'Adding bookmarks' do
  scenario 'user adds a bookmark' do
    visit '/'
    click_link 'Add Bookmark'
    fill_in :title, with: 'BBC'
    fill_in :url, with: 'www.bbc.co.uk'
    click_button 'Add'
    expect(page).to have_content 'www.bbc.co.uk was added to your bookmarks'
    click_link 'View All Bookmarks'
    expect(page).to have_content 'www.bbc.co.uk'
  end
end
