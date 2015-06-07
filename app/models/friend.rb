class Friend < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user

  @@daily_request_limit = 12
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"
  has_enumerated :friendship_status, :class_name => 'FriendshipStatus', :foreign_key => 'friendship_status_id'

  validates_presence_of   :friendship_status
  validates_presence_of   :user
  validates_presence_of   :friend
  validates_uniqueness_of :friend_id, :scope => :user_id
  
   validates_each :user_id do |record, attr, value|
    record.errors.add attr, 'can not be same as friend' if record.user_id.eql?(record.friend_id)
  end

  def denied?
    friendship_status.eql?(FriendshipStatus[:denied])
  end

  def pending?
    friendship_status.eql?(FriendshipStatus[:pending])
  end
  
  def accepted?
    friendship_status.eql?(FriendshipStatus[:accepted])
  end

  def notify_requester
    UserNotifier.friendship_accepted(self).deliver
  end

  #show your most recent friends
  def reverse
    Friendship.where('user_id = ? and friend_id = ?', self.friend_id, self.user_id).first
  end

private
  def set_pending
    friendship_status_id = FriendshipStatus[:pending].id
  end

  scope :recent, lambda { order('friends.created_at DESC') }

  def friend_to_be_requested
  	@friend.all (except current user)
  end

end
