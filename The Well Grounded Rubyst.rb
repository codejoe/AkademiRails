Teja
 -Apapun statement di ruby semuanya mengembalikan nilai
 -Semua object adalah true kecuali false dan nil
 -Semua method di ruby menerima block
 -Semua block itu argument
 -using keyword yield
 - |n| adalah parameter untuk 
 - lambda sama dengan def tetapi anonymous function
 
 - exit point 1
 def hello(str)
  temp = ''
  if str == 'hello'
    temp = str
  else
    temp = 'world'
  end
  temp
end

 - exit point 2
 def hello(str)
  temp = ''
  if str == 'hello'
    str
  else
    'world'
  end
end

- short circuit
def hello(str)
  if str.length > 5 && str == 'hello' #if str.length > 5 jika kondisi pertama tidak memungkinkan maka langsung keluar dari block
    str
  else
    'world'
  end

- && => evaluasi

- self di private method implicit receiver
- self di protected method bisa implicit dan explicit receiver

name public, private, protected
self v,x,v
implicit v,v,v
instance v,x,x


# Chapter 1 => Bootstrapping your Ruby literacy
A Ruby syntax survival kit
  - arithmetic
  - assignment
  - print something to the screen
  - get a line of keyboard input 
  - convert a numeric string to a number
  - compare two values
  - conditional execution
  - special value objects true,false,nil
  - the default object self
  - put comments in code files
Tour of the Ruby installation
Walk-throughs of sample Ruby programs
The mechanics of Ruby extensions
Ruby’s out-of-the-box command-line tools

# Chapter 2 => Objects, methods, and local variables
Objects and object-orientation
  - Method yang diakhiri karakter ? adalah convention untuk mengembalikan nilai boolean
Innate vs. learned object capabilities
Method parameter, argument, and calling syntax
Local variable assignment and usage
Object references

# Chapter 3 => Organizing objects with classes
Creating multiple objects with classes
Setting and reading object state
Automating creation of attribute read and write methods
Class inheritance mechanics
Syntax and semantics of Ruby constants
Question:
Apabila kita ingin menambahkan method sebaiknya digunakan reopening class atau extend class?
Arti %.2f ?




