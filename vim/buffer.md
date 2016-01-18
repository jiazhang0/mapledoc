# Vim Buffers

A buffer is an area of Vim's memory used to hold text read from a file.

* :e filefoo	filefoo is read into a new buffer that holds a temporary copy of the file
* :new 		a new window with a new (empty) buffer
* :ls		List the current buffers (including their numbers).
* :b <number>	Display the buffer with the given number.
* :b <partial>	Display the first buffer matching the partial name (or press Tab for name completion).
* :bd		Delete the current buffer; will fail if unsaved (nothing is deleted).
* :bd!		Delete the current buffer; will discard any changes (changes are lost).
* :bnext, :bn
* :bprev, :bp	changing between buffers
* :buffers

Ref:
1. [Vim Buffers](http://vim.wikia.com/wiki/Buffers)
