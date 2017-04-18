# =============================================================================
# Copyright (c) 2017 All Right Reserved, Madani Digital
#
# This source is subject to the Madani Digital
# All other rights reserved.
#
# @file_name app/models/payment.rb
# @author Ginanjar CK
# @note Payment model
# =============================================================================

class Payment < ApplicationRecord
  # Setup transient attributes for your model (attr_accessor)
  # e.g.
  # attr_accessor :temp

  # Setup validations for your model
  # e.g.
  # validates_presence_of :name
  # validates_uniqueness_of :name, case_sensitive: false
  validates :contact_id, presence: true
  validates :payable_type, presence: true
  validates :payable_id, presence: true
  validates :payment_method_id, presence: true
  validates :amount, presence: true

  # Setup relations to other models
  # e.g.
  # has_one :user
  # has_many :users
  # has_and_belongs_to_many :users
  # has_many :employees, through: :users
  belongs_to :contact
  belongs_to :payable, polymorphic: true
  belongs_to :source, polymorphic: true
  belongs_to :payment_method

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
