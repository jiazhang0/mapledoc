gcc tips

1 show default include paths

    g++ -E -x c++ - -v < /dev/null 
    clang++ -E -x c++ - -v < /dev/null

Ref: https://stackoverflow.com/questions/11946294/dump-include-paths-from-g
