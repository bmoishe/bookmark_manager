require 'bookmark'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.create('http://www.makersacademy.com')
      Bookmark.create('http://www.destroyallsoftware.com')
      Bookmark.create('http://www.google.com')
      # con = PG.connect(dbname: 'bookmark_manager_test')
      # con.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      # con.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
      # con.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end

  describe '.create' do
  it 'creates a new bookmark' do
    Bookmark.create('http://www.testbookmark.com')

    expect(Bookmark.all).to include 'http://www.testbookmark.com'
  end
end
end
