class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    raise TypeError, 'Can only add Todo objects' if item.class != Todo
    todos << item
  end

  def to_a
    @todos
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def done?
    all_done.size == size
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    todos << todo
  end
  alias_method :add, :<<

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    todos.fetch(index).done!
  end

  def mark_undone_at(index)
    todos.fetch(index).undone!
  end

  def shift
    todos.shift
  end

  def unshift(item)
    todos.unshift(item)
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    remove_item = todos.fetch(index)
    todos.delete(remove_item)
  end

  def each
    counter = 0
    while counter < todos.size
      yield(todos[counter])
      counter += 1
    end
    self
  end

  def select
    new_list = TodoList.new(title)

    each do |todo|
      new_list.add(todo) if yield(todo)
    end
    new_list
  end

  def find_by_title(string)
    select { |todo| todo.title == string}.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    complete_item = select { |todo| todo.title == title }.first
    return if complete_item.nil?
    complete_item.done!
  end

  def mark_all_done!
    each { |todo| todo.done! }
  end

  def mark_all_undone!
    each { |todo| todo.undone! }
  end

  def to_s
    text = "---- #{title} ----\n"
    text << todos.map(&:to_s).join("\n")
    text
  end

  private

  attr_reader :todos
end

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end
