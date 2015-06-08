class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # accepts_nested_attributes_for :friends, allow_destroy: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :instagram]
         
  #associations 
   has_many :friends
   has_many :photos, -> {order("created_at desc")}, :dependent => :destroy
   belongs_to :gym 
   has_many :invitations, :dependent => :destroy
   has_many :rsvps, :dependent => :destroy
   has_many :friendships_initiated_by_me, -> { where('initiator = ?', true) }, :class_name => "Friendship", :foreign_key => "user_id", :dependent => :destroy
   has_many :friendships_not_initiated_by_me, -> { where('initiator = ?', false) }, :class_name => "Friendship", :foreign_key => "user_id", :dependent => :destroy
  MALE    = 'M'
  FEMALE  = 'F'

  #messaging 
    has_many :all_sent_messages, :class_name => "Message", :foreign_key => "sender_id", :dependent => :destroy
    has_many :sent_messages, -> { where("messages.sender_deleted = ?", false).order("messages.created_at DESC") },
             :class_name => 'Message',
             :foreign_key => 'sender_id'

    has_many :received_messages, -> { where("messages.recipient_deleted = ?", false).order("messages.created_at DESC") },
             :class_name => 'Message',
             :foreign_key => 'recipient_id'
    has_many :message_threads_as_recipient, :class_name => "MessageThread", :foreign_key => "recipient_id"
 
    #named scopes
  scope :recent, -> {order('users.created_at DESC')}
  scope :premium, -> {where(:premium => true)}
  scope :bros
  scope :hos 
  scope :cardio 
  scope :lifting 

    #invite your friends to sign up 
  def signup_invitation(email, user, message)

    @recipients  = "#{email}"
    @subject     = "#{:would_like_you_to_join.l(:user => user.login, :site => configatron.community_name)}"
    @sent_on     = Time.now
    @user = user
    @url  = signup_by_id_url(user, user.invite_code)
    @message = message

    mail(:to => @recipients, :subject => @subject)    
  end


  #omniauth authentication
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def everyone_but_me(id) 
     @friend = User.all(except current_user)
  end

   def deactivate
    return if admin? #don't allow admin deactivation
    User.transaction do
      update_attribute(:activated_at, nil)
      update_attribute(:activation_code, make_activation_code)
    end
  end

  def activate
    User.transaction do
      update_attribute(:activated_at, Time.now.utc)
      update_attribute(:activation_code, nil)
    end
    UserNotifier.activation(self).deliver
  end

  def active?
    activation_code.nil? && !activated_at.nil?
  end

   def reset_password
     new_password = newpass(8)
     self.password = new_password
     self.password_confirmation = new_password
     return self.valid?
  end

  def newpass( len )
     chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
     new_password = ""
     1.upto(len) { |i| new_password << chars[rand(chars.size-1)] }
     return new_password
  end
  def owner
    self
  end
   def can_request_friendship_with(user)
    !self.eql?(user) && !self.friendship_exists_with?(user)
  end

  def friendship_exists_with?(friend)
    Friendship.where("user_id = ? AND friend_id = ?", self.id, friend.id).first
  end
   def friends_ids
    return [] if accepted_friendships.empty?
    accepted_friendships.map{|fr| fr.friend_id }
  end
   def admin?
    role && role.eql?(Role[:admin])
  end
  def premium?
    role && role.eql?(Role[:premium])
  end
  def member?
    role && role.eql?(Role[:member])
  end

  def male?
    gender && gender.eql?(MALE)
  end

  def female
    gender && gender.eql?(FEMALE)
  end

end
