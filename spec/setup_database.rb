require 'pg'

def setup_database
  con = PG.connect(dbname: 'bookmark_manager_test')
  con.exec("TRUNCATE bookmarks;")
end
