class HomeController < ApplicationController
   before_action :authenticate_user!

  def index
    @data_init = Office.where("user_id=?", current_user.id)

    @data = Office.left_outer_joins(:employees)   
             .select('offices.id as id_offices, offices.name as name_office, count("employees.id") as count_employees')
             .where('user_id=?', current_user.id)
             .group('offices.name')
  end
end
