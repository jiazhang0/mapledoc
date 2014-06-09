# Usage of colon in shell

Colon(:) is a builtin of bash, but I am not sure whether it is a builtin for sh.
<br />

Four usages:

## equa to true

colon could be placed everywhere where command 'true' shows, such as

**null clause**

    :
    echo $?   # 0

**if clause**

    if : ; then
        echo 'yes';
    fi

## placeholder for variable replacement

    : ${username=`whoami`}
    # ${username=`whoami`}   Gives an error without the leading :
    #                        unless "username" is a command or builtin...

## create or truncate a file

    : >/tmp/1
    : >>/tmp/1

## begin a comment line
## field separator: var PATH
## function name
    :()
    {
      echo "The name of this function is "$FUNCNAME" "
      # Why use a colon as a function name?
      # It's a way of obfuscating your code.
    }

    :

    # The name of this function is :
