class HomeController < ApplicationController
  def index
    @data_init = Office.where("user_id=?", current_user.id)

    @data = Employee.joins(:office)   
             .select('offices.id as id_offices, offices.name as name_office, count("employees.id") as count_employees')
             .where("user_id=?", current_user.id)
             .group('offices.name')
  end
end
