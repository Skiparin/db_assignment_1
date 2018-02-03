# db_assignment_1

To get the repository, you need to clone it. Simply copy the url and write "git clone https://github.com/Skiparin/db_assignment_1".

If you have ruby and gdbm installed, you can simply run the file with: ruby simple_db.rb

If not it would be easiest to run the file with docker and Helge's image. If you have Helge's image you can run: docker run -it --rm -v $(pwd):/src -w /src helgecph/pythonruby sh -c "ruby simple_db.rb"

The program is a simple database interface. Where you can get and set key value pairs. The key should always be in a Integer, but the value can be anything. The program has more instructions.
