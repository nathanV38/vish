# Copyright 2011-2012 Universidad Politécnica de Madrid and Agora Systems S.A.
#
# This file is part of ViSH (Virtual Science Hub).
#
# ViSH is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ViSH is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with ViSH.  If not, see <http://www.gnu.org/licenses/>.

class QuizSession < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  has_many :quiz_answers, :dependent => :destroy

  def quizJSON(options=nil)
  	self.quiz
  end

  def results
  	self.quiz_answers
  end

  def results_url
  	return "/quiz_sessions/" + self.id.to_s() + "/results/"
  end

  def close_url
  	return "/quiz_sessions/" + self.id.to_s() + "/close/"
  end

  def delete_url
  	return "/quiz_sessions/" + self.id.to_s() + "/delete/"
  end

end
