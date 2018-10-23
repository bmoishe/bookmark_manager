require 'pg'
class Bookmark


  def self.all
    if ENV['test_database']
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end
      rs = con.exec("SELECT * FROM bookmarks;")

      rs.map { |bookmark|
        bookmark['url']
      }
  end

  def self.create(url)
    if ENV['test_database']
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end
    con.exec("INSERT INTO bookmarks(url) VALUES('#{url}');")
  end
  #
  # def self.display
  #     self.each do |bookmark|
  #       p bookmark
  #     end
  # end

end
