class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def watches
    Watch.where(:user_id => self.id)
  end

  def movie
    Movie.find(self.id)
  end
end
