Tinyfugue 5 highlighting
========================

The way tf5 handles highlighting is that when they're saved, they end up being
written to /home/ish/tf-dir/hilite.tf.

As a result, the file can be editted directly as well.

An example, which also works, looks like this:

```
/def -Fp1 -aBCrgb540 -mregexp -t'^Somewhere.*muck,\\s[\\w.\'-]+\\shas\\s(dis|re)?connected\\.\\s?$'
```

This example creates a highlight that's bold yellow, and will match any of the
following:

```
Somewhere on the muck, Character has connected.
Somewhere on the muck, Character has reconnected.
Somewhere on the muck, Character has disconnected.
```
