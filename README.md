hostnamr
========

A name generator which gives you easily to remember names which mean nothing!

---

**2026 Update**

This is an ancient project of mine, from 2006, put on github in 2013. This now 
is an update I just did to put it back up online. All the javascript, html, css, 
is kept original, kept like it was, back in the day, and still runs smoothly on
2026 browsers. Nothing short of amazing for me, personally, you're milage may vary.

The one thing is did was to retire the original 2006 Ruby/Sinatra backend.
Replacing the server side name generation syllable juggling algo (generation
logic from `hiragana.rb` and `solmisation.rb`) with javascript inlined to the
site allows me now to run it static on GitHub Pages. Also it allows me to drop
all the old server deployment gunk. 

All original HTML, CSS and frontend from 2006 are preserved as-is. The historic
Ruby source (`hostnamr_app.rb`, `hiragana.rb`, `solmisation.rb`, `views/`)
remains in the repository for reference. Everything below this note is the
original README.

Welcome to my history show!

---

Check out the live site at: <https://crux.github.io/hostnamr>

Alorithm & History
-----------------

Super simple juggling of syllables. Please take it with tongue in cheek and
don't take it serious. It was when i recognized that in japanese you can
concatenate arbitrary hiragana syllables and come up with some pronounceble
word. This gave me the idea for hostnamr, to create (hopefully) nonsense words
and to use them as host name alternatives. Besides it was just a test drive
for some HTML and rails coding. And that was in 2005. Now i revived this to
play with some sinatra and check the redhat openshift cloud service.
