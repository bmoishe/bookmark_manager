require 'pg'
feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'A user can see bookmarks' do
    Bookmark.create('http://www.makersacademy.com')
    Bookmark.create('http://www.destroyallsoftware.com')
    Bookmark.create('http://www.google.com')
    # con = PG.connect(dbname: 'bookmark_manager_test')
    # con.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    # con.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    # con.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

end
