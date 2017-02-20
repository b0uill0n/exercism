module BookKeeping
  VERSION = 3
end

class School
  def initialize
    @archive = Hash.new { |hash, key| hash[key] = [] }
  end

  def students(grade)
    @archive[grade]
  end

  def add(name, grade)
    @archive[grade].push(name).sort!
  end

  def students_by_grade
    @archive.keys.sort.map { |key| { grade: key, students: @archive[key] } }
  end
end
