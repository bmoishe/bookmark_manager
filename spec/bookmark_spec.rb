require 'bookmark'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.create(url: 'http://www.makersacademy.com', title: 'test1')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'test2')
      Bookmark.create(url: 'http://www.google.com', title: 'test3')
      # con = PG.connect(dbname: 'bookmark_manager_test')
      # con.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      # con.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
      # con.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
      bookmarks = Bookmark.all
      expect(bookmarks).to include(:url => "http://www.makersacademy.com",:title => 'test1')
      expect(bookmarks).to include(:url => "http://www.destroyallsoftware.com",:title => 'test2')
      expect(bookmarks).to include(:url => "http://www.google.com", :title => 'test3')
    end
  end

  describe '.create' do
  it 'creates a new bookmark' do
    Bookmark.create(url: 'http://www.testbookmark.com', title: 'test')
    expect(Bookmark.all).to include ({:url => 'http://www.testbookmark.com', :title => 'test'})
  end
end
end
