# =============================================================================
# Copyright (c) 2017 All Right Reserved, Madani Digital
#
# This source is subject to the Madani Digital
# All other rights reserved.
#
# @file_name app/models/article.rb
# @author Ginanjar CK
# @note Article model
# =============================================================================

class Article < ApplicationRecord
  # Setup transient attributes for your model (attr_accessor)
  # e.g.
  # attr_accessor :temp

  # Setup validations for your model
  # e.g.
  # validates_presence_of :name
  # validates_uniqueness_of :name, case_sensitive: false
  validates :slug, presence: true
  validates :title, presence: true
  validates :author_name, presence: true
  validates :category_id, presence: true
  validates :available_on, presence: true

  # Setup relations to other models
  # e.g.
  # has_one :user
  # has_many :users
  # has_and_belongs_to_many :users
  # has_many :employees, through: :users
  belongs_to :category
  belongs_to :source, polymorphic: true

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
