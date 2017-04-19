  # =============================================================================
# Copyright (c) 2017 All Right Reserved, Madani Digital
#
# This source is subject to the Madani Digital
# All other rights reserved.
#
# @file_name app/models/address.rb
# @author Ginanjar CK
# @note Address model
# =============================================================================

class Address < ApplicationRecord
  # Setup transient attributes for your model (attr_accessor)
  # e.g.
  # attr_accessor :temp

  # Setup validations for your model
  # e.g.
  # validates_presence_of :name
  # validates_uniqueness_of :name, case_sensitive: false
  validates :ident_name,
    presence: true,
    uniqueness: { case_sensitive: false }
    # format: { with: IDENT_NAME_FORMAT }
  validates :name, presence: true
  validates :district_id, presence: true
  validates :city_id, presence: true
  validates :state_id, presence: true
  validates :country_id, presence: true

  # Setup relations to other models
  # e.g.
  # has_one :user
  # has_many :users
  # has_and_belongs_to_many :users
  # has_many :employees, through: :users
  belongs_to :district
  belongs_to :city
  belongs_to :state
  belongs_to :country
  has_many :contact_addresses
  has_one :masjid

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
