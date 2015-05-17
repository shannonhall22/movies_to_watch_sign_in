class AddMovieTitleToWatches < ActiveRecord::Migration
  def change
    add_column :watches, :movie_title, :string
  end
end
