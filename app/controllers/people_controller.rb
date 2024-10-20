class PeopleController < ApplicationController
layout 'people'

  def index
    @msg = 'Person data'
    @data = Person.all
  end

  def show 
    @msg = "Indexed data."
    @data = Person.find(params[:id])
  end

  def add
    @msg = 'add new data'
    @person = Person.new
    if request.post? then
      Person.create(person_params)
      redirect_to '/people'
    end
  end

  def create
    if request.post? then
      @person = Person.create(person_params)
      if @person.save then
        redirect_to '/people'
      else
        @msg = '入力に問題があります'
        render 'add'
      end
    end
  end



  def edit 
    @msg = ' edit data.[id =' + params[:id] + ']'
    @person = person.find(params[:id])
  end

  def update
    obj = Person.find(params[:id])
    obj.update(person_params)
    redirect_to '/people'
  end
  
  def delete
    obj = Person.find(params[:id])
    obj.destroy
    redirect_to '/people'
  end

  def find
    @msg = 'please type search word ...!'
    @people= Array.new
    if request.post? then
      f = params[:find].split(',')
      @people = Person.where('name like ?', '%' + params[:find] + '%').order 'age asc'

    end
  end

  private
  def person_params
    params.require(:person).permit(:name, :age, :mail)
  end

end
