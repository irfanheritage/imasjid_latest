# =============================================================================
# Copyright (c) 2017 All Right Reserved, Madani Digital
#
# This source is subject to the Madani Digital
# All other rights reserved.
#
# @file_name app/models/masjid.rb
# @author Ginanjar CK
# @note Masjid model
# =============================================================================

class Masjid < ApplicationRecord
  # Setup transient attributes for your model (attr_accessor)
  # e.g.
  # attr_accessor :temp

  # Setup validations for your model
  # e.g.
  # validates_presence_of :name
  # validates_uniqueness_of :name, case_sensitive: false
  validates :name, presence: true
  validates :slug, presence: true
  validates :address_id, presence: true

  # Setup relations to other models
  # e.g.
  # has_one :user
  # has_many :users
  # has_and_belongs_to_many :users
  # has_many :employees, through: :users
  belongs_to :address
  has_many :inventories
  has_many :events

  #
  # Setup scopes
  #

  #
  # Setup for additional gem-related configuration
  #

  #
  # Setup callbacks
  #

  #
  # Setup additional methods
  #
end
