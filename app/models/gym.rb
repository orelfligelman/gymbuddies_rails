class Gym < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_many :users

  # def place_gym 
  # 	@gym.find(params[:id]) #need next gym to be populated into view 
  # end
end
