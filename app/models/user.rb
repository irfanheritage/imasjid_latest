# =============================================================================
# Copyright (c) 2017 All Right Reserved, Madani Digital
#
# This source is subject to the Madani Digital
# All other rights reserved.
#
# @file_name app/models/user.rb
# @author Ginanjar CK
# @note User model
# =============================================================================

class User < ApplicationRecord
  enum role: [:user, :vip, :admin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup transient attributes for your model (attr_accessor)
  # e.g.
  # attr_accessor :temp

  # Setup validations for your model
  # e.g.
  # validates_presence_of :name
  # validates_uniqueness_of :name, case_sensitive: false
  validates :email, presence: true
  validates :contact_id, presence: true

  # Setup relations to other models
  # e.g.
  # has_one :user
  # has_many :users
  # has_and_belongs_to_many :users
  # has_many :employees, through: :users
  belongs_to :contact
  has_many :user_roles

  #
  # Setup scopes
  #

  #
  # Setup for additional gem-related configuration
  #

  #
  # Setup callbacks
  #
  after_initialize :set_default_role, :if => :new_record?

  #
  # Setup additional methods
  #
  def set_default_role
    self.role ||= :user
  end
end
