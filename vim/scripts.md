# Script development for vim

Author: Neil <kai.7.kang@gmail.com>

Last Modified: Jan 15, 2016

## Types

### Strings
    :echo "this is a string with a \" double quote"
    :echo 'the double quote " does not need escaping here'

### Numbers

* Decimal number: 1, 2, 3, 10, 100, and so on
* Hexadecimal: 0x01, 0x02, 0x03, 0x0A, 0x64
* Octal: 01, 02, 03, 012, 0144

      :echo 10 + 0x0A + 012

## Variables

### Variable types
* String: A simple string such as "this is a string"
* Number: A numeric value such as 123 or 0x123
* List: An ordered sequence of items (an ordered array)
* Dictionary: An unordered associative array holding key-value pairs
* Funcref: A reference to a function

**Examples:**

    :let mystringvar = "a string"
    :let mynumbervar = 123
    :let mylistvar1 = [1,2,"three",0x04, myfivevar]
    :let mylistvar2 = [[1,2,3],["four","five","six"]]
    :let mydictvar2 = {1: "one",2: "two","tens":{0: "ten",1: "eleven"}}

    :let Myfuncrefvar = function("Myfunction")
    :echo Myfuncrefvar()
    :call Myfuncrefvar()

### Variable scopes
* v: Vim predefined global scope
* g: Global scope
* b: Buffer scope—only available in the buffer where it was defined
* t: Tab scope—only available in the Vim tab where it was defined
* w: Window scope—only available to the current Vim window (viewport)
* l: Function scope—local to the function it is defined in
* s: Sourced file scope—local to a Vim script loaded using :source
* a: Argument scope—used in arguments for functions

** Example: **
     let g:sum=0
     function SumNumbers(num1,num2)
         let l:sum = a:num1+a:num2
         "check if previous sum was lower than this
         if g:sum < l:sum
             let g:sum=l:sum
         endif
         return l:sum
     endfunction

     " test code, this will print 7 (value of l:sum)
     echo SumNumbers(3,4)
     " this should also print 7 (value of g:sum)
     echo g:sum


## Conditions

### True/False

For both string values and numeric values:

    * val1 == val2 : True if val1 equals to val2
    * val1 != val2 : True if val1 is not equal to val2
    * val1 > val2 : True if val1 is higher than val2
    * val1 < val2 : True if val1 is lower than val2
    * val1 >= val2 : True if val1 is higher than or equal to val2
    * val1 <= val2 : True if val1 is lower than or equal to val2

For string values:

    * str1 =~ str2 : True if str1 contains the str2 substring or is equal to str2
    * str1 !~ str2 : True if str1 does not contain, and is not equal to the str2 substring

### if-elseif-else-endif

    if condition1
        code-to-execute-if-conition1-is-true
    elseif condition2
        code-to-execute-if-condition2-is-true
    else
        default
    endif


## Loops

### For loops

    for myvar in range(1,10)
        echo myvar
    endfor

    let mylist = ['a','b','c','d','e','f','g','h','i','j','k']
    for itemvar in mylist
        echo itemvar
    endfor

    let mydict = {a: "apple", b:"banana", c: "citrus" }		-> a, b, c are needded to quoted
    for keyvar in keys(mydict)
        echo mydict[keyvar]
    endfor

    -> it ouputs values sorted by default ??

### While loops

    while condition
        execute-this-code
    endwhile

It has **break continue** too.


## List and Directionary

### List

* index begins with 0
* supports negative index(no ** -0**)

#### Examples

    let mylistvar3 = [1,2,3,4]
    call add(mylistvar3, 5)
    echo mylistvar3			-> [1,2,3,4,5]

    let mylistvar4 = [1,2,3,4]
    let mylistvar4 = mylistvar4 + [5,6,7,8]
    echo mylistvar4			-> [1, 2, 3, 4, 5, 6, 7, 8]

    let mylistvar5 = [1,2,3,4]
    call extend(mylistvar5, [5,6,7,8])
    echo mylistvar5			-> [1, 2, 3, 4, [5, 6, 7, 8]] ?? 
    ?????????????????????		-> Result with vim 7.4 is [1, 2, 3, 4, 5, 6, 7, 8]

    call remove(mylistvar5, 3)		-> 3 is index

### Dictionary

Two ways to index:

1 index number

    let mydictvar1 = {1: "one", 2: "two", 3: "three"}
    echo mydictvar1[2]

2 by key

    let mydictvar4 = {'banana': 'yellow', 'apple': 'green'}
    echo mydictvar4['apple']
    echo mydictvar4.apple


## Functions

### Definition

    function Name(arg1, arg2,...argN) keyword
        code-to-execute-when-function-is-called
    endfunction

* Function name **MUST** starts with a capital letter and only contains letters, numbers and underscores
* argN: N's threshold is 20 -> Why?
* keyword: **Dict & Range**




