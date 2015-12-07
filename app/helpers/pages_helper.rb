module PagesHelper

  def calculategpa(passcourses)
    if passcourses.count() > 0
      passcourses.map(&:cgpa).sum/passcourses.count()
    else
      passcourses.count()
    end
  end

  def totalCredit(passcourses)
    3 * passcourses.count()
  end

end