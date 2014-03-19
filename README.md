cl-hltb
====

This is a LISP port of the hltb tool (https://github.com/fenak/hltb).

It was developed by a friend as a way to play with Go, and I did the same as a way to play with LISP. :)

From the Original tool README:
hltb is a simple tool written in Go for fetching data from http://howlongtobeat.com.


#### Usage

```
cl-hltb "Awesome Game Name"
```

#### Building

In order to build it on your system, you need the following packages installed:
- sbcl
- cl-quicklisp

Then, with the packages above installed, go to the cloned folder and run:
```
$ sbcl
* (load "cl-hltb.lisp")
```

This will fetch aditional libs, load the code and generate an executable core-dump from the LISP runtime on the current folder.