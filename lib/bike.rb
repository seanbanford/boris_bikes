class Bike
@broken = false

  def working?
    if @broken == true
      false
    else
     true
   end
  end

  def report_broken
    @broken = true
  end

end
