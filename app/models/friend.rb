class Friend < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end
