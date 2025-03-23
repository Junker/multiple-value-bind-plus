MULTIPLE-VALUE-BIND+
===================

`MULTIPLE-VALUE-BIND+` macro is a macro similar to standard `MULTIPLE-VALUE-BIND`
but with support for `_` placeholder symbols which are ignored.

Examples:
```common-lisp
MULTIPLE-VALUE-BIND-PLUS>
 (multiple-value-bind+ (a _ b)
     (values 1 2 3)
   (values a b))
1
3
```

## Credits

inspired by [DESTRUCTURING-BIND+](https://github.com/shamazmazum/destructuring-bind-plus)
