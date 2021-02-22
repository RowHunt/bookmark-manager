require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    # * Added href: here to try to pass test
    Bookmark.create(href: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(href: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.create(href: 'http://www.google.com', title: 'Google')
    # connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    # connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks')

    # * Added title: here to try to pass test
    expect(page).to have_link (title: 'Makers Academy', href: "http://www.makersacademy.com")
    expect(page).to have_link (title: 'Destroy All Software', href: "http://www.destroyallsoftware.com")
    expect(page).to have_link (title: 'Google', href: "http://www.google.com")
  end
end
