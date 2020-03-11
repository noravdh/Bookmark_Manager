require './lib/bookmarkclass'

describe 'Bookmarks' do
  let(:bookmark) { Bookmarks.new }
  it 'can create an instance' do
    expect(bookmark).to be_a_kind_of Bookmarks
  end

  it 'can respond to all method' do
    expect(bookmark).to respond_to(:all)
  end

  it 'can print out the bookmarks array' do
    expect(bookmark.bookmarks).to eq(bookmark.bookmarks)
  end
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.rubyguides.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    expect(bookmark.all).to include "https://www.rubyguides.com/"
    expect(bookmark.all).to include "http://www.destroyallsoftware.com"
    expect(bookmark.all).to include "http://www.google.com"
  end

end
